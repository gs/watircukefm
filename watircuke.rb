#!/usr/bin/env ruby
require 'lib/run_watircuke_setup'
include RunWatirCukeSetup

class RunMe        

  def initialize
    start(ARGV[0], ARGV[1], ARGV[2], ARGV[3])
  end

  def start(test, out, browser, web)
    run_with_browser = "BROWSER=#{browser}" if RunWatirCukeSetup::validate_browser(browser)
    is_cmd = "CMD=true" unless web
    if ("#{test}" =~/\@/) 
      folder = RunWatirCukeSetup::setup(out ||= test.gsub("\@","").gsub("\,","_"))
      result = "#{folder}/../#{out}.html"
      system "cucumber #{is_cmd}" + "#{run_with_browser}" + " --guess -t #{test} -f html > #{result}"
      RunWatirCukeSetup::finishit(folder, out, is_cmd)
    elsif ("#{test}" =~/features/) 
      folder = RunWatirCukeSetup::setup(out ||= test.gsub(/\w+\//,"").gsub(/\.\w+/,""))
      result = "#{folder}/../#{out}.html"
      system "cucumber #{is_cmd} " + "#{run_with_browser}" + " --guess #{test} -f html > #{result}"
      RunWatirCukeSetup::finishit(folder, out, is_cmd)
    else
      RunWatirCukeSetup::default_run
    end
  end
end

RunMe.new


