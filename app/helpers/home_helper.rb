module HomeHelper
  def howmany_comments(id)
    Comment.where(:announcement_id => id).count
  end

  def posted_at(created_at, author)
    t :post_time, :time => time_ago_in_words(created_at), :user => author
  end

  def comments(id)
    link_to I18n.locale == :en ? pluralize(howmany_comments(id), t(:comment)) : "#{howmany_comments(id)} #{t(:comment)}", :action => 'comment', :id => id
  end

  def can_edit?(author)
    unless session[:user].nil?
      if session[:level] == 'admin' or session[:user] == author
        return 1
      end
    end
  end

  def get_author(id)
    return Announcement.find_by_id(id).author
  end

  def url_tags(body)
    if body.include? '<novel>'
      return body.gsub(/<novel>(\d{1,3})<\/novel>/) { link_to(make_name(LightNovel.find($1)), :controller => :light_novel, :action => :read, :id => $1) }
    elsif body.include? '<translation>'
      return body.gsub(/<translation>(\d{1,3})<\/translation>/) { link_to(make_name(Translation.find($1)), :controller => :scans, :action => :read, :id => $1) }
    else
      return body
    end
  end

  def make_name(object)
    return t :novel_link, :name => JapaneseTitle.translate_title(object.name), :volume => object.volume, :chapter => object.chapter
  end
end
