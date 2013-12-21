class UrlShortener
  def self.shorten(url, &get_related)
    related = get_related.call(url.to_s)
    existing = related.first

    unless existing.nil?
      existing[:short_code]
    else
      SecureRandom::urlsafe_base64 4
    end
  end
end
