require 'rubygems'
require 'colorize'
require 'fileutils'
require 'ruby-debug'
require 'chronic'
require 'rspec'
require 'nokogiri'
require 'open-uri'
require 'test/unit/assertions'
require 'features/support/read_config'
require 'features/support/create_screenshot_folder'
require 'features/support/screenshot'
require 'features/support/check_missing_translations'
require 'cucumber/formatter/unicode'
require 'features/support/select_browser'
include Test::Unit::Assertions

begin
  #read the config.yml file found in config/config.yml
  ##--------------------------------------------------
  read_config               
  if ENV['BROWSER'].nil?
    BROWSER = select_browser("firefox")
  else
    BROWSER = select_browser(ENV['BROWSER'])
  end
  #BROWSER = select_browser(@br)
  CHECK_TRANSLATIONS = @check_translation
  TRANSLATION_TAG = @translation_tag
  LANGUAGES = #@fixtures

  ##-------------------------------------------------

  folder_prefix = "public/test_results"

  if Dir["#{folder_prefix}/*"].select{|x| File.directory?(x)}.map{|x| [File.ctime(x), x]}.sort_by{|x| x.first}.last
    screenshot_path = (Dir["#{folder_prefix}/*"].select{|x| File.directory?(x)}.map{|x| [File.ctime(x), x]}.sort_by{|x| x.first}.last.last.inspect + "/screenshots/").gsub!("\"","")
    # screenshot_path += "/screenshots/"
    # screenshot_path.gsub!("\"","")
  else
    screenshot_path = "#{folder_prefix}/screenshots/"
  end                                 
  
  #create screenshot folder function
  #  screenshot_path = create_screenshot_folder

  browser = BROWSER
  # "before all"
  Before do
    @table = {}
    @screenshot_path = screenshot_path
    @browser = browser
    @table.merge! YAML.load_file("config/config.yml")
    @environment = "http://"
    @time = Time.now
  end
  
  #after each scenario: checking for missing translation on page, count scenario time, makes screenshot if failed
  After do |scenario|
    t = Time.new.to_i
    check_missing_translations if CHECK_TRANSLATIONS                                                         
    embed_screenshot("#{@screenshot_path}screenshot-#{t}", "/#{@screenshot_path}screenshot-#{t}") if scenario.failed?
    scenario_time(@time) 
  end

  # after each step which is called '@new_feature' make a screenshot
  AfterStep('@new_feature') do
    t = Time.new.to_i  
    embed_screenshot("#{@screenshot_path}screenshot-#{t}", "/#{@screenshot_path}screenshot-#{t}")

  end
rescue Exception => ex
  puts "#{ex}".red
end                                                                                            

