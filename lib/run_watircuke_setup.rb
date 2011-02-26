module RunWatirCukeSetup
  require 'rubygems'
  require 'cucumber'
  require 'colorize'

  require "#{Dir.pwd}/features/support/create_screenshot_folder"

  def setup(folder)
    t=Time.now.strftime("%y%m%d%H%M")
    create_screenshot_folder("#{folder}", t)
  end                                    

  def validate_browser(bro)
    browser = %w/ie ff firefox chrome safari/
    browser.include?(bro)
  end

  def name_the_test(test)
    test.gsub(/\w+\_/,"")
  end

  def default_run
    puts "Did not found the test.".red
    puts 
    puts "You could run me with:"
    puts "./watircuke.rb @tag output".green
    puts "or"
    puts "./watircuke.rb features/my_test.feature output".green
    puts " "
  end
  
  def finishit(folder, test)
    puts
    puts "Copy the path to browser to view results"
    puts "#{Dir.pwd}/#{folder.gsub('screenshots','')}#{test}.html".green
  end
  
end
