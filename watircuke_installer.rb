#!/usr/bin/ruby
require 'rubygems'

def start(choice)
  if choice == "y"
    if RUBY_PLATFORM !~ /mingw/i
      puts "Installing rubygem installer (require root access)"
      puts "Please provide a root password:"
      system 'sudo gem install geminstaller'
    else
      system 'gem install geminstaller'
    end                 
    
    current_folder = Dir.pwd
    puts "Clone WatirCuke"
    system 'git clone http://github.com/gs/watircuke.git WatirCuke'

    puts "Install required gems"
    Dir.chdir 'WatirCuke'
    if RUBY_PLATFORM !~ /mingw/i
      system 'sudo geminstaller config/geminstaller.yml'
      puts "Clone the support for the Cucumber bundles into TextMate"
      system 'git clone git://github.com/aslakhellesoy/cucumber-tmbundle.git ~/Library/Application\ Support/TextMate/Bundles/Cucumber.tmbundle'
      puts "Copy WatirCuke TextMate bundles"
      system 'unzip TextMateBundles/WatirCuke.tmbundle.zip -d ~/Library/Application\ Support/TextMate/Bundles/'
      puts "Change permissions on files"
      system 'sudo chmod -R 755 .'
      #puts "Update TextMate bundles"
      #	system 'osascript -e \"tell app "TextMate" to reload bundles'
    else
      system 'geminstaller config/geminstaller.yml'
    end

    current_dir = Dir.pwd
  else
    puts ""
    puts "Please install:  "
    puts "*"
    puts "* Github client http://git-scm.com/"
    puts "* Ruby"
    puts "* RubyGems (http://rubyforge.org/frs/?group_id=126)"
    puts ""
    puts "And RERUN THIS SCRIPT"
  end
end

def main
  puts ""
  puts "**********************************"
  puts "* WatirCuke installation script  *"
  puts "**********************************"
  puts ""
  puts ""
  puts "Make sure that all following programs are INSTALLED on your machine: "
  puts ""
  puts "1) GitHub client http://git-scm.com/)"
  puts "2) Ruby"
  puts "3) Ruby Gems (http://rubyforge.org/frs/?group_id=126)"
  puts "4) TextMate(MAC) or REDCAR(Linux/Windows) editor will be very handy in writting the scenarios"
  puts ""
  puts "Do you have installed all above programs? y / n"
  choice = gets.chomp

  start(choice)
end

main
