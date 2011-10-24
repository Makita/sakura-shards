module LightNovelHelper
  def which_title?(object)
    I18n.locale == :en ? object.title : object.japanese_title
  end

  def parse(body)
    return body if params[:method] == '3'
    split = body.split(/\r/)
    en, jp = [], []
    a = 0
    split.each do |index|
      a += 1
      if index == '<br />'
        jp.push(index)
        en.push(index)
        a = 0
        next
      end
      a % 2 == 1 ? jp.push(index) : en.push(index)
    end
    return params[:method] == '2' ? jp.join : en.join.sub(/<br \/>/, '')
  end
end
