require_relative '../../lib/url_shortener'
require 'uri'

describe UrlShortener do
  describe '#shorten' do
    let(:url) { URI('http://example.com') }
    it 'should return a short code for a given url' do
      result = UrlShortener.shorten(url) do
        []
      end
      expect(result).to_not be_blank
    end

    it 'should return an existing short code if one already exists' do
      existing_urls = [{url: 'http://example.com', short_code: 'ShortCode'}]
      result = UrlShortener.shorten(url) do |url|
        existing_urls.select { |u| u[:url] == url }
      end
      expect(result).to eq('ShortCode')
    end
  end
end


class String
  def blank?
    self.empty?
  end
end

class NilClass
  def blank?
    true
  end
end
