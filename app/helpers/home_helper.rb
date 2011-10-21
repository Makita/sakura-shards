module HomeHelper
  def howmany_comments(id)
    Comment.where(:announcement_id => id).count
  end

  def break_lines(string)
    return string.gsub(/<br \/>/, '')
  end

  def posted_at(created_at, author)
    t :post_time, :time => time_ago_in_words(created_at), :user => author
  end

  def comments(id)
    link_to I18n.locale == :en ? pluralize(howmany_comments(id), t(:comment)) : "#{howmany_comments(id)} #{t(:comment)}", :action => 'comment', :id => id
  end

  def can_edit?(author)
    unless session[:user].nil?
      if session[:level] == 'admin' or session[:dispname] == author
        return 1
      end
    end
  end
end
