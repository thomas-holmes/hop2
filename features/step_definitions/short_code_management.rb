Then(/^I should be redirected to a private management page$/) do
  disable = page.find("#disable_url")
  expect(disable).to_not be_nil
end

When(/^I am viewing the private management page for a short code$/) do
  @original_url = 'http://example.com'
  create_shortened_url(@original_url)
end

When(/^I disable the short code$/) do
  click_on 'Disable'
end

Then(/^I should be redirected to a 404$/) do
  expect(status_code).to eq 404
end
