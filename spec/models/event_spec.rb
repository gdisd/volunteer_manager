require 'rails_helper'

RSpec.describe Event, type: :model do
  it 'is a thing' do
    expect {Event.new}.to_not raise_error
  end

  it 'has event name, date and details' do
    event = Event.new
    event.event_name = 'Beginning JavaScript'
    event.date = '20170821'
    event.location = 'Qualcomm AY'
    event.number_of_tas = '4'
    event.start_time = '9:00 a.m.'
    event.end_time = '4:00 p.m.'
    event.meetup_url = 'http://www.meetup.com'
    expect(event.save).to be true
    event2 = Event.find_by_event_name('Beginning JavaScript')
    expect(event2.event_name).to eq 'Beginning JavaScript'
    expect(event2.date.to_s).to eq "2017-08-21"
    expect(event2.location).to eq 'Qualcomm AY'
    expect(event2.number_of_tas).to eq 4
    expect(event2.start_time).to eq '9:00 a.m.'
    expect(event2.end_time).to eq '4:00 p.m.'
    expect(event2.meetup_url).to eq 'http://www.meetup.com'
  end
end
