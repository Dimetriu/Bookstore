module ApplicationHelper
  def back_to_store
    if URI(request.referer).path.split('/').include? 'users'
      link_to "Back to Store", root_url, { class: 'btn btn-default mb-20' }
    else
      link_to "Back to Store", request.referer, { class: 'btn btn-default mb-20' }
    end
  end
end
