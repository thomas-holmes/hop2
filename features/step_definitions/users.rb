Given(/^I am a signed in user$/) do
  @current_user = as_a_signed_in_user
end

Then(/^I should be able to create a new a new account$/) do
  register_account
  User.find_by!(email: 'test1@example.com')
end

When(/^have an existing account$/) do
  user = create_account
  click_on 'Sign in'
  sign_in(user)
end

Then(/^I should be able to login to an existing account$/) do
  expect(current_path).to eq root_path
end

When(/^I register a new account$/) do
  visit(root_url)
  register_account
end

Then(/^I should be redirected to my user page$/) do
  user = User.find_by!(email: 'test1@example.com')
  expect(current_path).to eq(user_path(user.id))
end

Then(/^there should be a sign out link$/) do
  expect(page).to have_link('Sign out', href: destroy_user_session_path)
end

Then(/^a link to my profile$/) do
  expect(page).to have_link(@current_user.email, href: user_path(@current_user))
end

Then(/^no sign in link or sign up link$/) do
  expect(page).to_not have_link('Sign in', href: new_user_session_path)
  expect(page).to_not have_link('Sign up', href: new_user_registration_path)
end
