# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def asset_link(path)
      "/documentation/assets/#{path}"
    end
  
    def highlight(name)
      (@highlight == name) ? ' highlighted' : nil
    end
                                                  
end
