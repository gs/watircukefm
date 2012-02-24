module WatirCukeHelpers

  def failed(what)
    fail("Sorry, I wasn't able to find the " + "'#{what}'" + " element ")
  end

  def basic_types(field)
    case field
    when "button", "checkbox", "radio", "select", "text_field", "file_field", "span", "div"
      [:id, :name, :value, :class, :text, :index]
    when "img"
      [:id, :src, :name, :text, :alt, :class, :index]
    when "link"
      [:text, :id, :class, :title, :href]
    when "table"
      [:id, :name, :class, :index]
    end
  end

  def find_button(what)
    basic_types("button").each do |type|
      what = what.to_i if type == :index && what.to_i > 0
      action = @browser.button(type, what)
      action.exists? ?
      (return action.click ? true : failed(what)) : next
    end.send(:fail, "Sorry, I wasn't able to find the " + "'#{what}'" + " element ")
  end

  def find_checkbox(what)
    basic_types("checkbox").each do |type|
      what = what.to_i if type == :index && what.to_i > 0
      action = @browser.checkbox(type, what)
      action.exists? ?
      (return action.click ? true : failed(what)) : next
    end.send(:fail, "Sorry, I wasn't able to find the " + "'#{what}'" + " element ")
  end

  def find_image(what)
    basic_types("img").each do |type|
      what = what.to_i if type == :index && what.to_i > 0
      action = @browser.image(type, what)
      action.exists? ?
      (return action.click ? true : failed(what)) : next
    end.send(:fail, "Sorry, I wasn't able to find the " + "'#{what}'" + " element ")
  end

  def find_link(what)
    basic_types("link").each do |type|
      what = what.to_i if type == :index && what.to_i > 0
      action = @browser.link(type, /#{what}/)# || @browser.link(type, /#{what}/)
      action.exists? ?
      (return action.click ? true : failed(what)) : next
     end.send(:fail, "Sorry, I wasn't able to find the " + "'#{what}'" + " element ")

    # when @browser.link(:text, /#{what}/).exists?
    # then @browser.link(:id, /#{what}/).click
    # then @browser.link(:title, what).click
    # then  @browser.link(:href, /#{what}/).click

  end

  def find_radio_button(what)
    basic_types("radio").each do |type|
      what = what.to_i if type == :index && what.to_i > 0
      action = @browser.radio(type, what)
      action.exists? ?
      (return action.click ? true : failed(what)) : next
    end.send(:fail, "Sorry, I wasn't able to find the " + "'#{what}'" + " element ")
  end

  def find_table(row, column, what)
    row = row.to_i
    column = column.to_i
    basic_types("table").each do |type|
      what = what.to_i if type == :index && what.to_i > 0
      action = @browser.table(type, what)
      action.exists? ?
      (return action[row][column].click ? true : failed(what)) : next
    end.send(:fail, "Sorry, I wasn't able to find the " + "'#{what}'" + " element ")
  end

  def find_select_list(option, what)
    basic_types("select").each do |type|
      what = what.to_i if type == :index && what.to_i > 0
      action = @browser.select_list(type, what)
      action.exists? ?
      (return action.select(option) ? true : failed(what)) : next
    end.send(:fail, "Sorry, I wasn't able to find the " + "'#{what}'" + " element ")

    # when @browser.select_list(:class, /(^|\s)#{what}(\s|$)/).exists?
    # then @browser.select_list(:class, /(^|\s)#{what}(\s|$)/).set(option)

  end

  def find_text_field(what, with)
    basic_types("text_field").each do |type|
      what = what.to_i if type == :index && what.to_i > 0
      action = @browser.text_field(type, what)
      action.exists? ?
      (return action.set(with) ? true : failed(what)) : next
    end.send(:fail, "Sorry, I wasn't able to find the " + "'#{what}'" + " element ")

    # when @browser.text_field(:class, /(^|\s)#{what}(\s|$)/).exists?
    # then @browser.text_field(:class, /(^|\s)#{what}(\s|$)/).set(with)

  end

  def find_file_field(what, with)
    basic_types("file_field").each do |type|
      what = what.to_i if type == :index && what.to_i > 0
      action = @browser.file_field(type, what)
      action.exists? ?
      (return action.set(with) ? true : failed(what)) : next
    end.send(:fail, "Sorry, I wasn't able to find the " + "'#{what}'" + " element ")
    # when @browser.field_field(:class, /(^|\s)#{what}(\s|$)/).exists?
    # then @browser.field_field(:class, /(^|\s)#{what}(\s|$)/).set(with)
  end

  def find_span(what,with)
    basic_types("span").each do |type|
      what = what.to_i if type == :index && what.to_i > 0
      action = @browser.span(type, what)
      action.exists? ?
      (return action.text == with ? true : failed(what)) : next
    end.send(:fail, "Sorry, I wasn't able to find the " + "'#{what}'" + " element ")

    # when @browser.span(:class, /(^|\s)#{what}(\s|$)/).exists?
    # then @browser.span(:class, /(^|\s)#{what}(\s|$)/).text == with

  end

  def find_div(what)
    basic_types("div").each do |type|
      what = what.to_i if type == :index && what.to_i > 0
      action = @browser.div(type, what)
      action.exists? ?
      (return action.click ? true : failed(what)) : next
    end.send(:fail, "Sorry, I wasn't able to find the " + "'#{what}'" + " element ")
  end

  def click_alert_button_ok
    if @browser.class.to_s == "Watir::IE"
      Process.kill(9,$pid)  if $pid
      $pid = Process.create(:app_name => "ruby #{Dir.pwd}/lib/popup_killer_ie.rb", :creation_flags => Process::DETACHED_PROCESS).process_id
    elsif @browser.class.to_s == "FireWatir::Firefox"
      @browser.startClicker("OK", 3)
    elsif @browser.class.to_s == "Watir::Safari"
      #      $fail("JS clicking not availalble for Safari Watir currently...")
    else
      @browser.execute_script("window.alert = function(msg) { return true; }")
      @browser.execute_script("window.confirm = function(msg) { return true; }")
    end
  end

  def create_output
    begin
      File.open("all_objects.txt", "w") { |f| f.puts(@browser.show_all_objects) }
    rescue Exception => ex
      fail("Sorry could not load an object -> #{ex}")
    end
  end

  def parse_from_yaml(with)
    w = with.gsub(":","").split(".")
    puts "<li class=\"step passed\">Exchanged: <b>#{with} => #{@table[w[0]][w[1]]}</b></li>"
    return @table[w[0]][w[1]]
  end

  def scenario_time(time)
    puts "<h3 id=\"scenario_1\" style=\"cursor: pointer; \"><span class=\"keyword\">Scenario took:</span> <span class=\"val\">#{Time.now - time}</span></h3>"
  end

  #validate if this is a fixture
  def fixture?(value)
    value =~ /^\:\w*\./
  end

  def calculate_date(datevalue)
    return Chronic.parse(datevalue).strftime("%d-%m-%Y") if not Chronic.parse(datevalue).nil?
  end

  def create_screenshot(def_test=nil)
    t = Time.new.to_i
    def_test ? embed_screenshot("#{@screenshot_path}screenshot-#{t}", "screenshots/screenshot-#{t}") : embed_screenshot("#{@screenshot_path}screenshot-#{t}", "/#{@screenshot_path}screenshot-#{t}")
  end
end

World(WatirCukeHelpers)