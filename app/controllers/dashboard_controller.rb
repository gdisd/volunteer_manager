class DashboardController < ApplicationController

  def index
    @user = current_user
    @application = Application.new
    @events = Event.all
  end

end
