module FeatureSupport

  def sign_up(email, password)
    visit '/'
    click_link 'Sign Up'
    fill_in 'user[email]', with: email
    fill_in 'user[password]', with: password
    fill_in 'user[password_confirmation]', with: password
    click_button 'Sign up'
  end

  def sign_in(email, password)
    visit '/'
    click_link 'Sign In'
    fill_in 'user[email]', with: email
    fill_in 'user[password]', with: password
    click_button 'Log in'
  end

  def sign_out
    click_link 'Sign Out'
  end

  def add_class(name, location, tas, desc, start, ends, url)
    visit '/'
    click_link 'Add Event'
    fill_in 'event[event_name]', with: name
    fill_in 'event[location]', with: location
    fill_in 'event[number_of_tas]', with: tas
    fill_in 'event[description]', with: desc
    fill_in 'event[start_time]', with: start
    fill_in 'event[end_time]', with: ends
    fill_in 'event[meetup_url]', with: url
    click_button 'Create Event'
  end
  def create_event
    event = Event.create! :event_name => 'Beginning JavaScript', :date => Date.today + 3.days, :location => 'Qualcomm AY', :number_of_tas => '4', :description => 'This is a beginning JavaScript Class. Bring a laptop and a learning attitude.', :start_time => '9:00 a.m.', :end_time => '4:00 p.m.', :meetup_url => 'http://www.meetup.com'
  end

  def create_admin
    user = User.create! :email => 'admin@admin.com', :password => 'adminadmin', :password_confirmation => 'adminadmin', :status => 'approved'
    user.add_role :admin
  end

  def create_approved_user(email, password)
    user = User.create! :email => email, :password => password, :password_confirmation => password, :status => 'approved'
  end
end
