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
      expect(response).to redirect_to short_url_url(show_url.secret_code)
    end
  end

  describe '#redirect' do
    let!(:url) { ShortUrl.create!(url: "http://example.com", short_code: "ABCDEFG", secret_code: "ABC123") }

    it 'should redirect to the original url' do
      get :redirect, short_code: url.short_code
      expect(response).to redirect_to(url.url)
    end

    it 'should not redirect if url is disabled' do
      url.update(disabled: true)
      get :redirect, short_code: url.short_code
      expect(response.status).to eq(404)
    end
  end

  describe '#disable' do
    let!(:url) { ShortUrl.create!(url: "http://example.com", short_code: "ABCDEFG", secret_code: "ABC123") }

    it 'should disable ShortUrl' do
      get :disable, secret_code: url.secret_code
      url.reload
      expect(url.disabled).to be_true
    end
  end
end
