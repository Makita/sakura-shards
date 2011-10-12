module HomeHelper
  def howmany_comments(id)
    Comment.where(:announcement_id => id).count
  end

  def break_lines(string)
    return string.gsub(/<br \/>/, '')
  end
end
