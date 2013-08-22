class UrlShortener
  def self.shorten(url, codes)
    codes ||= [] # Relations return nil :(
    begin
      uri = URI.parse(url)
    rescue
      raise InvalidUrl.new 'URI must be a valid URL'
    end

    unless is_url?(uri)
      raise InvalidUrl.new 'URI must be a URL'
    end

    existing = codes.first

    unless existing.nil?
      existing[:short_code]
    else
      SecureRandom::urlsafe_base64 4
    end

  end

  private
  def self.is_url?(uri)
    true if uri.scheme.start_with?('http')
  end


  class InvalidUrl < Exception
  end

end
