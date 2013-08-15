When(/^I visit the homepage$/) do
  visit root_url
end

Then(/^it should load$/) do
  expect(title).to eq("Shorty")
end

Then(/^I should be able to submit a url to shorten$/) do
  #fill_in 'short_url_url', with: "http://example.com"
  #click_on 'Submit'
  pending
end
