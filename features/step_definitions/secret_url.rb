Then(/^I should be redirected to a private management page$/) do
  disable = page.find("#disable_url")
  expect(disable).to_not be_nil
end

