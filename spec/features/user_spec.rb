require 'rails_helper'

RSpec.feature "Users", type: :feature do
  context 'Creating an account' do
    Steps 'Go to sign up page' do
      Given 'I am on the sign up page' do
        # part of sign_up command
      end
      Then 'I can enter my email and password' do
        sign_up('joe@joe.com', 'joejoe')
        expect(page).to have_content("Welcome! You have signed up successfully.")
      end
    end
  end

  context 'Logging out of an account' do
    Steps 'Go to sign up page' do
      Given 'I am on the sign up page' do
        # part of sign_up command
      end
      Then 'I can enter my email and password' do
        sign_up('joe@joe.com', 'joejoe')
        click_link 'Sign Out'
        expect(page).to have_content('Signed out successfully')
      end
    end
  end
end
