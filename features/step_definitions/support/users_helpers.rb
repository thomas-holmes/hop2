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
  FactoryGirl.create(:user)
end

def as_a_signed_in_user
  user = create_account
  visit new_user_session_path
  sign_in(user)
  user
end
