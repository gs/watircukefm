#!/usr/bin/env ruby
require 'rubygems'
require 'cucumber'
require 'colorize'

require 'features/support/create_screenshot_folder'

#this are the tests that have config_ files in config/machine/config_*.yml files - designed to work with sanity checks
tests=%w/bbc_en bbc_de bbc_pl bbc_es bbc_br bbc_fr staging_en staging_de staging_pl staging_es staging_br staging_fr live_en live_de live_pl live_es live_br live_fr/

class RunMe                       
  
  def initialize(tests)
    @tests = tests
    # system "killall -9 firefox-bin"   
  end

  def start
    if @tests.include?(ARGV[0])
      test_name = name_the_test
      copy_config_yml_file
      folder = setup(ARGV[0])           
      run_with_browser = "BROWSER=#{ARGV[1]}" if validate_browser(ARGV[1])
      system "cucumber " + "#{run_with_browser}" + " --guess -t @#{test_name} -f html > #{folder}/../#{ARGV[0]}.html"
      finishit
    elsif ("#{ARGV[0]}" =~/\@/) 
      run_with_browser = "BROWSER=#{ARGV[2]}" if validate_browser(ARGV[2])
      folder = setup(ARGV[1] ||= ARGV[0].gsub("\@","").gsub("\,","_"))
      system "cucumber " + "#{run_with_browser}" + " --guess -t #{ARGV[0]} -f html > #{folder}/../#{ARGV[1]}.html"
      finishit
    elsif ("#{ARGV[0]}" =~/features/) 
      run_with_browser = "BROWSER=#{ARGV[2]}" if validate_browser(ARGV[2])
      folder = setup(ARGV[1] ||= ARGV[0].gsub(/\w+\//,"").gsub(/\.\w+/,""))
      system "cucumber " + "#{run_with_browser}" + " --guess #{ARGV[0]} -f html > #{folder}/../#{ARGV[1]}.html"
      finishit
    else
      default_run
    end
  end
      
  def default_run
    puts "Did not found the test.".red
    puts 
    puts "You could run me with:"
    puts "./watircuke.rb @tag output".green
    puts "or"
    puts "./watircuke.rb features/my_test.feature output".green
    puts " "
    @tests.collect! {|x| x + ", " }
    print "or with any of the tests: "
    print "#{@tests}".yellow
    puts
    puts "./watircuke.rb live_en".green
  end
  def finishit
    puts "Test finished"
  end
  
  def setup(folder)
    t=Time.now.strftime("%y%m%d%H%M")
    create_screenshot_folder("#{folder}", t)
  end                                    
  
  def validate_browser(bro)
    browser = %w/ie ff firefox chrome safari/
    browser.include?(bro)
  end

  def name_the_test
    ARGV[0].gsub(/\w+\_/,"")
  end
  
  def copy_config_yml_file
    config_name = "config_" + ARGV[0].to_s
    FileUtils.cp "./config/machines/#{config_name}.yml", "./config/config.yml"
  end

end

run = RunMe.new(tests)

run.start
