#not yet in use
require 'rubygems'
require "httparty"
require "nokogiri"
require "ruby-debug"
require "rspec"

Debugger.settings[:autolist] = 1
Debugger.settings[:autoeval] = true

class Fetcher
  include HTTParty
end


Given /^I fetch "([^"]*)"$/ do |url|
  @url = url
  @response = Fetcher.get(url)
end

Then /^all images should be found$/ do
  doc = Nokogiri::HTML(@response.body)
  doc.search("img").each do |img|
    src = img["src"]
    image_path = if src.match(/^\//)
      @url + src
    elsif src.match(/^http/)
      src
    end
    @checked_images ||= Array.new
    next if @checked_images.include?(image_path)
    if Fetcher.head(image_path).code != 200
      violated "image #{src} not found"
    else
      @checked_images << image_path
    end
  end
end