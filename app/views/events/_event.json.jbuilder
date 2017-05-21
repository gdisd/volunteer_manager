json.extract! event, :id, :event_name, :date, :location, :number_of_tas, :desciption, :start_time, :end_time, :meetup_url, :created_at, :updated_at
json.url event_url(event, format: :json)
