Given /I load "(.*)" fixture/ do |table|
  @table.merge! YAML.load_file("features/fixtures/#{table}.yml")
end

Transform /^\:\w*\.\w*$/ do |step_arg|
  what = parse_from_yaml(step_arg)   if fixture?(step_arg)
end

Given /I click the "(.*)" button(.*)/ do |what, what2|
  if what2 == " with alert"
    click_alert_button_ok
  elsif what2 =~ /with index \d+/
    index = what2.gsub(" with index ","")
    @browser.button(:id => what, :index => index.to_i).click
  else
    find_button(what)
  end
end


Given /I click the "(.*)" checkbox/ do |what|
  find_checkbox(what)
end

Given /I click the "(.*)" div/ do |what|
  find_div(what)
end

Given /I click the "(.*)" image/ do |what|
  find_image(what)
end

Given /I click the "(.*)" link(.*)/ do |what, what2|
  if what2 == " with alert"
    click_alert_button_ok
    find_link(what)
  elsif what2 =~ /with index \d+/
    index = what2.gsub(" with index ","")
    if @browser.link(:text => what, :index => index.to_i).exists?
       @browser.link(:text => what, :index => index.to_i).click
     elsif @browser.link(:class => what, :index => index.to_i).exists?
        @browser.link(:class => what, :index => index.to_i).click
    end
  else
    find_link(what)
  end
end

Given /I onmouseover the "(.*)" link$/ do |what|
  @browser.link(:text, /#{what}/).exists?
  @browser.link(:text, /#{what}/).fire_event('onmouseover')
end

Given /I click the "(.*)" radio button/ do |what|
  find_radio_button(what)
end

Given /I click row "(.*)" in the "(.*)" table/ do |row, column, what|
  find_table(row, column, what)
end

Given /I select "(.*)" from "(.*)"/ do |with, what|
  find_select_list(with, what)
end

Given /I fill in the text field "(.*)" with "(.*)"/ do |tf_name, what|
  find_text_field(tf_name, what)
end

Given /I fill in the date field "(.*)" with "(.*)"/ do |tf_name, what|
  find_text_field(tf_name, calculate_date(what))
end

Given /I click the "(.*)" element/ do |what|
  find_element(what)
end


Given /I fill in the file field "(.*)" with "(.*)"/ do |ff_name, what|
  find_file_field(ff_name, what)
end

Then /I refresh the page/ do
  @browser.refresh
end

Then /I should see the "(.*)" image/ do |what|
  assert(@browser.image(:src, /what/).height.to_i == 0) ? false : true
end

Then /I take a screenshot/ do
   t = Time.new.to_i
   create_screenshot(ENV['DEF_TEST'] || ENV['CMD'])
end

Then /I should see the span "(.*)" with "(.*)"/ do |span, what|
  find_span(span, what)
end

Then /^I should (NOT )?see the text "(.*)"$/ do |visibility, what|
  expected = (visibility.to_s.strip == 'NOT') ? @browser.text.include?(what.strip).should == false : @browser.text.include?(what.strip).should == true
end

Then /^I should (NOT )?contain the html "([^\"]*)"$/ do |visibility, what|
  expected = (visibility.to_s.strip == 'NOT') ? @browser.html.index(what).should == nil  : @browser.html.index(what).should >= 0
end

Then /I click the "(.*)" link until I see the text "(.*)"/ do |click_link, what_to_see|
  find_link(click_link)
    while !@browser.text.index(what_to_see) do
          @browser.back
          sleep 5
          find_link(click_link)
   end
  @browser.text.index(what_to_see) != nil
end

Then /^I debug$/ do
  debugger
end

Given /I am redirected to "(.*)"/ do |what|
  url = @browser.url
  assert_equal(@environment + what, url)
end

Given /^I am on the "(.+)" page$/ do |page_name|
  @browser.goto(path_to(page_name))  #This step links up with the "path_to" method found in support/paths.rb
end

Given /^I go to "([^\"]*)"$/ do |url|
  @browser.goto(url)                 #Links to generic urls like "google.com"
end

Given /^I sleep for "([^\"]*)"$/ do |seconds|
  sleep seconds.to_i
end
Given /^I check all objects$/ do
  create_output
end

Then /^I sleep for (\d*) until I (NOT )?see the text "(.*)"/ do |seconds, visibility, what|

  case visibility.to_s.strip!
  when 'NOT'
    1.upto(seconds.to_i).each { |s| @browser.text[what.strip].nil? ? break : sleep(1) }
  else
    1.upto(seconds.to_i).each { |s| @browser.text[what.strip] ? break : sleep(1) }
  end

end

Then /^I go back$/ do
  @browser.back
end
