class WelcomeController < ApplicationController
  #welcome index page
  def index
    @events = Event.all
  end

  def get_involved
  end

end
