require 'rails_helper'

RSpec.feature "Events", type: :feature do
  context 'Creating an Event' do
    Steps 'Sign up' do
      Given 'I am on the sign up page' do
        # part of sign_up command
      end
      Then 'I can sign up as admin' do
        create_admin
        sign_in('admin@admin.com', 'adminadmin')
      end
      Then 'I can create an event' do
        add_class('Beginning JavaScript', 'Qualcomm AY', '4', 'This is a beginning JavaScript Class. Bring a laptop and a learning attitude.','9:00 a.m.', '4:00 p.m.', 'http://www.meetup.com')
        expect(page).to have_content('Beginning JavaScript')
        expect(page).to have_content('Qualcomm AY')
        expect(page).to have_content('4')
        expect(page).to have_content('This is a beginning JavaScript Class. Bring a laptop and a learning attitude.')
        expect(page).to have_content('9:00 a.m.')
        expect(page).to have_content('4:00 p.m.')
        expect(page).to have_content('http://www.meetup.com')
      end
    end
  end

end
