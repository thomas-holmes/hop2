require 'spec_helper'

describe ShortUrl do
  describe 'validation' do
    let(:short_url) { ShortUrl.new({short_code: 'ABC123', url: 'http://example.com', secret_code: 'ABC123DEF' }) }

    context 'short_code' do
      it 'must be present' do
        short_url.short_code = nil
        expect(short_url).to_not be_valid
      end

      it 'must be unique' do
        ShortUrl.create({short_code: 'ABC123', url: 'http://example.com', secret_code: 'HIJKLMNOPQ'})
        expect(short_url).to_not be_valid
      end
    end

    context 'secret_code' do
      it 'must be present' do
        short_url.secret_code = nil
        expect(short_url).to_not be_valid
      end

      it 'must be unique' do
        ShortUrl.create({short_code: 'ABC123X', url: 'http://example.com', secret_code: 'ABC123DEF'})
        expect(short_url).to_not be_valid
      end
    end

    context 'url' do
      it 'must be present' do
        short_url.url = nil
        expect(short_url).to_not be_valid
      end
    end

    context 'user' do
      it 'is  optional' do
        short_url.user = nil
        expect(short_url).to be_valid
      end
    end
  end
end
