require 'rails_helper'

RSpec.feature "OmniauthTests", js:true, type: :feature do
  context 'Sign in with Meetup' do
    Steps 'Go to the Home page to sign in with Meetup' do
      Given 'I am on the home page' do
        visit '/'
      end
      Then 'I click on the Sign in button'do
        click_link 'Sign In'
      end
      Then 'I should be on the Sign in page and i click on the Sign in with Meetup button' do
        click_link 'Sign in with Meetup'
      end
      Then 'I am taken to the Meetup Grant Access page, and I sign in' do
        fill_in 'email', with: 'leaann@notch8.com'
        fill_in 'password', with: 'password'
        click_button 'Log in and Grant Access'
      end
    end
  end
end
