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
      save_screenshot(id, to_html)
    end
  elsif Cucumber::WINDOWS
    def embed_screenshot(id, to_html)
      id = Dir.pwd.gsub("/","\\") + "\\" + id.gsub("/","\\")
      save_screenshot(id, to_html)
    end  
    else
    # Other platforms...
    def embed_screenshot(id, to_html)
      save_screenshot(id, to_html)
    end
  end
  
  def save_screenshot(id, to_html)
    File.open("#{id}.jpg",'wb') do |f|
       f.write(Base64.decode64(@browser.driver.screenshot_as(:base64)))
     end
    to_html.gsub!("public/","") if to_html =~ /public/
    embed("#{to_html}.jpg", "image/jpg")
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
