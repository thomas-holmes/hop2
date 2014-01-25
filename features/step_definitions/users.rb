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
