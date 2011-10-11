module ScansHelper
  def get_dl_link(array)
    name = array.name.gsub('_',' ')
    return Uploads.where(:name => name, :volume => array.volume, :chapter => array.chapter).first.url
  end

  def get_dl_name(name, volume, chapter)
    link = "[%s] Volume %d, Chapter %d" % [name, volume, chapter]
    return link
  end
end
