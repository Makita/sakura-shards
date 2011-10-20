module UrlHelper
  def with_subdomain(subdomain)
    subdomain = (subdomain || "")
    subdomain = "" if I18n.default_locale.to_s == subdomain
    subdomain += "." unless subdomain.empty?
    [subdomain, request.domain(tld_length), request.port_string].join
  end

  def url_for(options = nil)
    if options.kind_of?(Hash) && options.has_key?(:subdomain)
      options[:host] = with_subdomain(options.delete(:subdomain))
    end
    super
  end

  def tld_length
    tld_length = case Rails.env
      when 'production' then 2
      when 'development' then 0
      else 0
    end
  end 
end
