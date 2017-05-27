require 'rails_helper'

RSpec.feature "Dashboard", type: :feature do
  context 'Sign up to TA' do
    Steps 'Sign up' do
      Given 'I am on the sign up page' do
        # part of sign_up command
      end
      Then 'I can sign up as user' do
        sign_up('test@test.com', 'password')
      end
      Then 'I need a class to register for' do
        add_class('Beginning JavaScript', 'Qualcomm AY', '4', 'This is a beginning JavaScript Class. Bring a laptop and a learning attitude.','9:00 a.m.', '4:00 p.m.', 'http://www.meetup.com')
      end
      Then 'I can register for an event' do
      # add a class to be able to register
        visit '/dashboard'
        click_link 'Beginning JavaScript'
        click_link 'TA for this class'
        expect(page).to have_content('You are signed up to TA for Beginning JavaScript')
      end
    end
  end

end
