require 'rails_helper'

RSpec.describe Application, type: :model do
  it 'is a thing' do
    expect {Application.new}.to_not raise_error
  end

  it 'has a name, email,  and password' do
    app = Application.new
    app.name = 'Sally Ride'
    app.email = 'sallyr@nasa.gov'
    app.about_you = 'I am an astronaut'
    app.how_you_found_us = 'I found you from a friend'
    app.why_volunteer = 'I love to share my knowledge and make the world a better place'
    expect(app.save).to be true
    app2 = Application.find_by_email('sallyr@nasa.gov')
    expect(app2.name).to eq 'Sally Ride'
  end

end
