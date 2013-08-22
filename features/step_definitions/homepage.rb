When(/^I visit the homepage$/) do
  visit root_url
end

Then(/^it should load$/) do
  expect(title).to eq("Shorty")
end

