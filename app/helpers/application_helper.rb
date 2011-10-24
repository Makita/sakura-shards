module ApplicationHelper
  def str_to_link(string)
    return string.camelize.gsub(' ','_')
  end

  def break_lines(string)
    return string.gsub(/<br \/>/, '')
  end

  def back_to_home(string)
    link_to string, :controller => 'home', :action => 'index'
  end

  # Make i18n work with will_paginate

  include WillPaginate::ViewHelpers

  def will_paginate_with_i18n(collection = nil, options = {})
    will_paginate collection, options.merge(:previous_label => I18n.t(:previous), :next_label => I18n.t(:next))
  end

  def en_or_jp(object)
    return I18n.locale == :en ? object.id : object.announcements_id
  end
end
