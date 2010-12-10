# This is an example of how you can set up screenshots for your
# browser testing. Just run cucumber with --format html --out report.html
#
# The code below will work on OS X or Windows (with IE Watir only).
# Adding support for other platforms should be easy - as long as there is a 
# ruby library or command line tool to take pictures.
#

#TODO: fix the screenshots on windows - does not stores
module Screenshots      
  if Cucumber::OS_X
    def embed_screenshot(id, to_html)
      `screencapture -t png #{id}.png`
      to_html.gsub!("public/","") if to_html =~ /public/
      embed("#{to_html}.png", "image/png")
    end
  elsif Cucumber::WINDOWS
    # http://wtr.rubyforge.org/rdoc/classes/Watir/ScreenCapture.html
    require 'watir/screen_capture'
    include Watir::ScreenCapture
    def embed_screenshot(id, to_html)
      id = Dir.pwd.gsub("/","\\") + "\\" + id.gsub("/","\\")
      to_html.gsub!("public/", "") if to_html =~ /public/
      screen_capture("#{id}.jpg", true)   
      embed("#{to_html}.jpg", "image/jpg")
    end
  else
    # Other platforms...
    def embed_screenshot(id, to_html)
      STDERR.puts "Sorry - no screenshots on your platform yet."
    end
  end
end
World(Screenshots)

# After do |scenario|
#    embed_screenshot("#{@screenshot_path}screenshot-#{Time.new.to_i}")  if scenario.failed?
# end        

# Other variants:
#
# Only take screenshot on failures
#
#   After do |scenario|
#     embed_screenshot("screenshot-#{Time.new.to_i}") if scenario.failed?
#   end
#
# Only take screenshot for scenarios or features tagged @screenshot
#
#   After(@screenshot) do
#     embed_screenshot("screenshot-#{Time.new.to_i}")
#   end
