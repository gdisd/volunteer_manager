class DashboardController < ApplicationController

  def index
    # nobody logged in & user is trying to go to /profile (hacking)
    if current_user.nil?
      redirect_to '/users/sign_up'
    # if you are logged in
    else
      @user = current_user
      @application = Application.new
      @events = Event.all
    end
  end

end
