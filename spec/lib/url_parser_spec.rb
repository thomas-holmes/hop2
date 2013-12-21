require_relative '../../lib/url_parser.rb'

describe UrlParser do
  describe '#parse' do
    let(:expected) { URI.parse('http://example.com') }

    it 'returns correct URI' do
      url = UrlParser.parse('http://example.com')
      expect(url).to eq expected
    end

    it 'uri without scheme defaults to http' do
      url = UrlParser.parse('example.com')
      expect(url).to eq expected
    end

    it 'should raise if a url is poorly formed' do
      bad_uri = 'abc^^^'
      expect { UrlParser.parse(bad_uri) }.to raise_error(UrlParser::InvalidUrl)
    end

    it 'should raise if uri is not a url' do
      bad_url = 'ftp://example.com'
      expect { UrlParser.parse(bad_url) }.to raise_error(UrlParser::InvalidUrl)
    end
  end
end
