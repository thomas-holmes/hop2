require_relative '../../lib/url_shortener'

describe UrlShortener do
  describe '#shorten' do
    let(:url) { 'http://example.com' }
    it 'should return a short code for a given url' do
      result = UrlShortener.shorten(url, [])
      expect(result).to_not be_blank
    end

    it 'should raise if a url is poorly formed' do
      bad_uri = 'abc^^^'
      expect { UrlShortener.shorten(bad_uri, []) }.to raise_error(UrlShortener::InvalidUrl)
    end

    it 'should raise if uri is not a url' do
      bad_url = 'ftp://example.com'
      expect { UrlShortener.shorten(bad_url, []) }.to raise_error(UrlShortener::InvalidUrl)
    end

    it 'should return an existing short code if one already exists' do
      result = UrlShortener.shorten(url, [{url: 'http://example.com', short_code: 'ShortCode'}])
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
