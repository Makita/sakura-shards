module LightNovelHelper
  def which_title?(object)
    I18n.locale == :en ? object.title : object.japanese_title
  end

  def parse(body)
    return body if params[:method] == '3'
    split = body.split(/\r/)
    puts split.inspect
    en, jp = [], []
    a = 0
    split.each do |index|
      a += 1
      if index == '<br />'
        jp.push('<br />')
        en.push('<br />')
        a = 0
        next
      end
      if a % 2 == 1
        jp.push(index)
      else
        en.push(index)
      end
    end
    if params[:method] == '2'
      return jp.join
    else
      return en.join
    end
  end
end
