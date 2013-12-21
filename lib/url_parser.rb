require 'uri'

class UrlParser
  def self.parse(uri)
    convert_to_url(uri)

    rescue
      raise InvalidUrl.new 'URI must be a valid URL'
  end

  private
  def self.convert_to_url(uri)
    uri = URI.parse(uri)

    if is_url?(uri)
      uri
    else
      fix_uri(uri)
    end
  end

  def self.is_url?(uri)
    uri.scheme.start_with?('http') unless uri.scheme.nil?
  end

  def self.fix_uri(uri)
    if uri.scheme.nil?
      URI.parse("http://#{uri}")
    else
      raise InvalidUrl.new 'URI has a non-http* scheme'
    end
  end

  class InvalidUrl < Exception
  end
end
