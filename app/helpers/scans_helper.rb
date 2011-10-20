module ScansHelper
  def get_dl_link(array)
    name = array.name.gsub('_',' ')
    return Upload.where(:name => name, :volume => array.volume, :chapter => array.chapter).first.url
  end
end
