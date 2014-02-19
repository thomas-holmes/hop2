require 'spec_helper'

# Pretty horrible, refactor to use FactoryGirl
describe 'users/show' do
  let (:user) do
    double(User,
      {
        email: 'test@example.com',
        short_urls: [
          double(ShortUrl, {
            url: 'http://example1.com',
            short_code: 'abc123',
            clicks: [double, double, double]
          }),
          double(ShortUrl, {
            url: 'http://example2.com',
            short_code: 'def456',
            clicks: [double, double]
          })
        ]
      })
  end

  before (:each) do
    assign(:user, user)
    render
  end

  it 'Has user name' do
    expect(rendered).to include('test@example.com')
  end

  it 'contains correct urls' do
    expect(rendered).to have_selector("#url-abc123", text: 'http://example1.com')
    expect(rendered).to have_selector("#url-def456", text: 'http://example2.com')
  end

  it 'has the short_code text' do
    expect(rendered).to have_selector("#url-abc123", text: 'abc123')
    expect(rendered).to have_selector("#url-def456", text: 'def456')
  end

  specify 'each url has the count of clicks' do
    expect(rendered).to have_selector("#clicks-abc123", text: 3)
    expect(rendered).to have_selector("#clicks-def456", text: 2)
  end
end
