module ApplicationHelper
  def str_to_link(string)
    return string.camelize.gsub(' ','_')
  end

  def back_to_home(string)
    link_to string, :controller => 'home', :action => 'index'
  end
end
