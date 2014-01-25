Given(/^a shortened url for a site exists$/) do
  @original_url = "http://example.com"
  create_shortened_url(@original_url)
  @first_url = page.find('#short_url')[:href]
end

When(/^create another shortened url for the same url$/) do
  create_shortened_url(@original_url)
  @second_url = page.find('#short_url')[:href]
end

Then(/^both shortened urls should not match$/) do
  expect(@first_url).to_not eq(@second_url)
end
