def check_missing_translations
  #create a hash and reads the url page content looking for given translation's missing template
  h = Hash.new
  if doc = Nokogiri.HTML(open(@browser.url))
    doc.text.each_line { |line|
      words = line.split
      words.each { |w|
        if w.match(TRANSLATION_TAG)
          if h.has_key?(w)
            h[w] = h[w] + 1
          else
            h[w] = 1
          end
        end
      }
    }

    # sort the hash by value, and then print it in this sorted order
    h.sort{|a,b| a[1]<=>b[1]}.each { |elem|
      puts "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font style=\"BACKGROUND-COLOR: yellow\">Missing translation: <b>#{elem[0]}</b> has <b>#{elem[1]}</b> occurrences on <a href=\"#{@browser.url.to_s}\" target=\"blank\">#{@browser.url.to_s}</a> page &nbsp;&nbsp;&nbsp;->&nbsp;&nbsp;&nbsp;"
      t = Time.new.to_i         
      embed_screenshot("#{@screenshot_path}screenshot-#{t}", "/#{@screenshot_path}screenshot-#{t}")
     # embed_screenshot("#{@screenshot_path}screenshot-#{t}", "screenshots/screenshot-#{t}")
      puts "</font>"
    }
  else
    return {}
  end
end
