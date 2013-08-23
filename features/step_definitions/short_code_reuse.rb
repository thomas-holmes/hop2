Given(/^a shortened url for a site exists$/) do
  @original_url = "http://example.com"
  create_shortened_url(@original_url)
  @first_url = page.find('#short_url')[:href]
end

When(/^create another shortened url for the same url$/) do
  create_shortened_url(@original_url)
  @second_url = page.find('#short_url')[:href]
end

Then(/^both shortened urls should match$/) do
  expect(@first_url).to eq(@second_url)
end

def create_shortened_url(url)
  visit root_url
  fill_in 'short_url_url', with: url
  click_on 'Submit'
end
