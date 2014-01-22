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


def sign_in(user)
  fill_in :Email, with: user.email
  fill_in :Password, with: user.password
  click_button 'Sign in'
end

def register_account
  click_on 'Sign up'
  fill_in :Email, with: 'test1@example.com'
  fill_in :Password, with: 'password'
  fill_in 'Password confirmation', with: 'password'
  click_button 'Sign up'
end

def create_account
  User.create!(email: 'test@example.com', password: 'password', password_confirmation: 'password')
end
