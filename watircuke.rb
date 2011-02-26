#!/usr/bin/env ruby
require 'lib/run_watircuke_setup'
include RunWatirCukeSetup

class RunMe        

  def initialize
    start(ARGV[0], ARGV[1], ARGV[2])
  end

  def start(test, out, browser)
    if ("#{test}" =~/\@/) 
      run_with_browser = "BROWSER=#{browser}" if RunWatirCukeSetup::validate_browser(browser)
      folder = RunWatirCukeSetup::setup(out ||= test.gsub("\@","").gsub("\,","_"))
      result = "#{folder}/../#{out}.html"
      system "cucumber " + "#{run_with_browser}" + " --guess -t #{test} -f html > #{result}"
      RunWatirCukeSetup::finishit(result)
    elsif ("#{test}" =~/features/) 
      run_with_browser = "BROWSER=#{browser}" if RunWatirCukeSetup::validate_browser(browser)
      folder = RunWatirCukeSetup::setup(browser ||= test.gsub(/\w+\//,"").gsub(/\.\w+/,""))
      system "cucumber " + "#{run_with_browser}" + " --guess #{test} -f html > #{result}"
      RunWatirCukeSetup::finishit(result)
    else
      RunWatirCukeSetup::default_run
    end
  end
end

RunMe.new


