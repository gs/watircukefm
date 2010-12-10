module WatirCukeHelpers
  def find_button(what)
    case
    when @browser.button(:id, what).exists?
    then @browser.button(:id, what).click

    when @browser.button(:name, what).exists?
    then @browser.button(:name, what).click

    when @browser.button(:value, what).exists?
    then @browser.button(:value, what).click

    when @browser.button(:class, what).exists?
    then @browser.button(:class, what).click

    when @browser.button(:text, what).exists?
    then @browser.button(:text, what).click

    when @browser.button(:index, what.to_i).exists?
    then @browser.button(:index, what.to_i).click

      #			 when @browser.button(:text, /#{what}/).exists?
      #						then @browser.button(:text, /#{what}/).click
    else
      fail("Sorry, I wasn't able to find the " + "'#{what}'" + " element ")
    end
  end

  def find_checkbox(what)
    case
    when @browser.checkbox(:id, what).exists?
    then @browser.checkbox(:id, what).click

    when @browser.checkbox(:name, what).exists?
    then @browser.checkbox(:name, what).click

    when @browser.checkbox(:value, what).exists?
    then @browser.checkbox(:value, what).click

    when @browser.checkbox(:text, what).exists?
    then @browser.checkbox(:text, what).click

    when @browser.checkbox(:class, what).exists?
    then @browser.checkbox(:class, what).click

    when @browser.checkbox(:index, what.to_i).exists?
    then @browser.checkbox(:index, what.to_i).click

    else
      fail("Sorry, I wasn't able to find the " + "'#{what}'" + " element ")
    end
  end

  def find_image(what)
    case
    when @browser.image(:src, what).exists?
    then @browser.image(:src, what).click

    when @browser.image(:id, what).exists?
    then @browser.image(:id, what).click

    when @browser.image(:name, what).exists?
    then @browser.image(:name, what).click

    when @browser.image(:text, what).exists?
    then @browser.image(:text, what).click

    when @browser.image(:alt, what).exists?
    then @browser.image(:alt, what).click

    when @browser.image(:class, what).exists?
    then @browser.image(:class, what).click

    when @browser.image(:index, what.to_i).exists?
    then @browser.image(:index, what.to_i).click

    else
      fail("Sorry, I wasn't able to find the " + "'#{what}'" + " element ")
    end
  end

  def find_link(what)
    case
    when @browser.link(:text, what).exists?
    then @browser.link(:text, what).click

    when @browser.link(:id, what).exists?
    then @browser.link(:id, what).click


    when @browser.link(:class, what).exists?
    then @browser.link(:class, what).click

    when @browser.link(:text, /#{what}/).exists?
    then @browser.link(:text, /#{what}/).click

    when @browser.link(:id, /#{what}/).exists?
    then @browser.link(:id, /#{what}/).click

    when @browser.link(:title, what).exists?
    then @browser.link(:title, what).click

    when @browser.link(:href, /#{what}/).exists?
    then	@browser.link(:href, /#{what}/).click

    else
      fail("Sorry, I wasn't able to find the " + "'#{what}'" + " element ")
    end
  end

  def find_radio_button(what)
    case
    when @browser.radio(:id, what).exists?
    then @browser.radio(:id, what).click

    when @browser.radio(:name, what).exists?
    then @browser.radio(:name, what).click

    when @browser.radio(:value, what).exists?
    then @browser.radio(:value, what).click

    when @browser.radio(:text, what).exists?
    then @browser.radio(:text, what).click

    when @browser.radio(:class, what).exists?
    then @browser.radio(:class, what).click


    when @browser.radio(:index, what.to_i).exists?
    then @browser.radio(:index, what.to_i).click

    else
      fail("Sorry, I wasn't able to find the " + "'#{what}'" + " element ")
    end
  end

  def find_table(row, column, what)
    row = row.to_i
    column = column.to_i
    case
    when @browser.table(:id, what).exists?
    then @browser.table(:id, what)[row][column].click

    when @browser.table(:name, what).exists?
    then @browser.table(:name, what)[row][column].click

    when @browser.table(:class, what).exists?
    then @browser.table(:class, what)[row][column].click

    when @browser.table(:index, what.to_i).exists?
    then @browser.table(:index, what.to_i)[row][column].click

    else
      fail("Sorry, I wasn't able to find the " + "'#{what}'" + " element ")
    end
  end

  def find_select_list(option, what)
    case
    when @browser.select_list(:id, what).exists?
    then @browser.select_list(:id, what).select(option)

    when @browser.select_list(:name, what).exists?
    then @browser.select_list(:name, what).select(option)

    when @browser.select_list(:value, what).exists?
    then @browser.select_list(:value, what).select(option)

    when @browser.select_list(:text, what).exists?
    then @browser.select_list(:text, what).select(option)

    when @browser.select_list(:class, /(^|\s)#{what}(\s|$)/).exists?
    then @browser.select_list(:class, /(^|\s)#{what}(\s|$)/).set(option)

    when @browser.select_list(:index, what.to_i).exists?
    then @browser.select_list(:index, what.to_i).select(option)

    else
      fail("Sorry, I wasn't able to find the " + "'#{what}'" + " element ")
    end
  end

  def find_text_field(what, with)
    case
    when @browser.text_field(:id, what).exists?
    then @browser.text_field(:id, what).set(with)

    when @browser.text_field(:name, what).exists?
    then @browser.text_field(:name, what).set(with)

    when @browser.text_field(:value, what).exists?
    then @browser.text_field(:value, what).set(with)

    when @browser.text_field(:class, /(^|\s)#{what}(\s|$)/).exists?
    then @browser.text_field(:class, /(^|\s)#{what}(\s|$)/).set(with)

    when @browser.text_field(:index, what.to_i).exists?
    then @browser.text_field(:index, what.to_i).set(with)

    else
      fail("Sorry, I wasn't able to find the " + "'#{what}'" + " element ")
    end
  end

  def find_file_field(what, with)
    case
    when @browser.file_field(:id, what).exists?
    then @browser.file_field(:id, what).set(with)

    when @browser.field_field(:name, what).exists?
    then @browser.field_field(:name, what).set(with)

    when @browser.field_field(:value, what).exists?
    then @browser.field_field(:value, what).set(with)

    when @browser.field_field(:class, /(^|\s)#{what}(\s|$)/).exists?
    then @browser.field_field(:class, /(^|\s)#{what}(\s|$)/).set(with)

    when @browser.field_field(:index, what.to_i).exists?
    then @browser.field_field(:index, what.to_i).set(with)

    else
      fail("Sorry, I wasn't able to find the " + "'#{what}'" + " element ")
    end
  end

  def find_span(what,with)
    case
    when @browser.span(:id, what).exists?
    then @browser.span(:id, what).text == with

    when @browser.span(:name, what).exists?
    then @browser.span(:name, what).text == with

    when @browser.span(:value, what).exists?
    then @browser.span(:value, what).text == with

    when @browser.span(:class, /(^|\s)#{what}(\s|$)/).exists?
    then @browser.span(:class, /(^|\s)#{what}(\s|$)/).text == with

    when @browser.span(:index, what.to_i).exists?
    then @browser.span(:index, what.to_i).text == with

    else
      fail("Sorry, I wasn't able to find the " + "'#{what}'" + " element with " + "'#{with}'")
    end
  end

  def find_div(what)
    case
    when @browser.div(:id, what).exists?
    then @browser.div(:id, what).click

    when @browser.div(:text, what).exists?
    then @browser.div(:text, what).click

    when @browser.div(:name, what).exists?
    then @browser.div(:name, what).click

    when @browser.div(:value, what).exists?
    then @browser.div(:value, what).click

    when @browser.div(:class, what).exists?
    then @browser.div(:class, what).click

    when @browser.div(:index, what.to_i).exists?
    then @browser.div(:index, what.to_i).click

    else
      fail("Sorry, I wasn't able to find the " + "'#{what}'" + " element ")
    end
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
end

World(WatirCukeHelpers)
