require 'rails_helper'

RSpec.feature 'Visitor signs up' do
  before :all do
    visit signup_path
  end

  scenario 'with valid name, email and password' do
    puts page.body
    sign_up_with 'valid', 'valid@example.com', 'password'
    submit_form
    expect(page).to have_content('Log Out')
  end

  scenario 'with invalid email' do
    sign_up_with 'valid', 'invalid_email', 'password'

    expect(page).to have_content('Email is invalid')
    expect(page).to have_content('Sign Up')
  end

  scenario 'with blank password' do
    sign_up_with 'valid', 'valid@example.com', ''

    expect(page).to have_content("Password can't be blank")
    expect(page).to have_content('Sign Up')
  end

end
