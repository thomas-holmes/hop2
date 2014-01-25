Given(/^I am a logged in user$/) do
  @current_user = as_a_signed_in_user
end

When(/^I shorten a URL$/) do
  visit root_path
  create_shortened_url 'http://foosite.com'
end

Then(/^It should be listed on my user profile page$/) do
  visit user_path(@current_user)
  expect(page).to have_content('http://foosite.com')
end
