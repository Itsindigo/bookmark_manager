def create_bookmark
  visit '/'
  click_link 'Add link'
  fill_in('title', with: 'Useless Web')
  fill_in('url', with: 'http://theuselessweb.com/')
end

def create_account
  visit '/'
  click_link 'Create an account'
  fill_in('email', with: 'test@test.com')
  fill_in('password', with: 'qwerty')
  fill_in('password_confirmation', with: 'qwerty')
  click_button 'Sign up'
end

def sign_up(email: 'hello@aol.com',
            password: "12345",
            password_confirmation: "12345")
  visit '/users'
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'Sign up'
end
