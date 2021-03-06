#!/usr/bin/env ruby
def select_browser(browser)
  case browser
    when "safari"
      require 'safariwatir'
      Watir::Safari.new
      #Browser.set_fast_speed = true

    when "firefox", "ff"
      require 'watir-webdriver'
      Watir::Browser.new :firefox

    when "chrome"
      require 'watir-webdriver'      
      Watir::Browser.new :chrome

    when "ie", "internet explorer"
      # require 'watir'
      # require 'watir/ie'
      # require 'win32ole'
      # require 'win32/process'
      # ie = Watir::IE.new
      # ie.speed = :zippy #browser speed :fast / :zippy
      # return ie

      #works OK after update to newest gems

      require 'watir-webdriver'
      Watir::Browser.new :ie

    when "celerity"
      require 'celerity'
      Celerity::Browser.new

    when "headless"
      require 'headless'
      Headless.new
    else
      raise "This platform is not supported (#{PLATFORM})"
    end
end
