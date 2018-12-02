module Features
  module SessionHelpers
    def sign_up_with(name, email, password)
      visit signup_path
      fill_in 'user[name]', with: name
      fill_in 'user[email]', with: email
      fill_in 'user[password]', with: password
      fill_in 'user[password_confirmation]', with: password
      click_on 'Create User'
    end

    def sign_in
      user = create(:user)
      visit login_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_on 'Log In'
    end
  end
end
