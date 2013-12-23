Then(/^I should be able to submit a url to shorten$/) do
  fill_in 'short_url_url', with: "http://example.com"
  click_on 'Submit'
end

When(/^I create a shortened url$/) do
  @original_url = 'http://example.com'
  create_shortened_url(@original_url)
end

When(/^visit the shortened url$/) do
  shortened_url = page.find('#short_url')[:href]
  visit shortened_url
end

Then(/^I should be redirected to the original url$/) do
  expect(URI.parse current_url).to eq(URI.parse @original_url)
end
