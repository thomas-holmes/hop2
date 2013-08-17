require_relative '../spec_helper.rb'

describe ShortUrlsController, type: :controller do
  it 'can create a new ShortUrl' do
    post :create, short_url: {url: "http://example.com"}
  end

  describe 'creating a new ShortUrl' do
    let(:url) { ShortUrl.new(url: "http://example.com") }

    it 'should render the result page' do
      post :create, short_url: {url: url.url}
      show_url = assigns(:url)
      expect(response).to redirect_to short_url_url show_url
    end
  end

  describe '#redirect' do
    let!(:url) { ShortUrl.create!(url: "http://example.com", short_code: "ABCDEFG") }

    it 'should redirect to the original url' do
      get :redirect, short_code: "ABCDEFG"
      expect(response).to redirect_to(url.url)
    end
  end
end
