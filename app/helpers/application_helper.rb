module ApplicationHelper
  def back_to_store_button(html_options = {})
    if URI(request.referer).path.split('/').include? 'users'
      link_to "Back to Store", root_url, html_options
    else
      link_to "Back to Store", :back, html_options
    end
  end
end
