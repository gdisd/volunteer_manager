class DashboardController < ApplicationController

  def index
    # nobody logged in & user is trying to go to /profile (hacking)
    if current_user.nil?
      redirect_to '/users/sign_up'
    # if you are logged in
    else
      @users = User.all
      @user = current_user
      @application = Application.new
      @events = Event.all
    end
  end

  def set_user_status_to_approved
    @user = User.find(params[:user_id])
    @user.set_approved
    #send user an email notification that their application has been accepted
    ApplicantApprovedMailer.applicant_approved_notice_email(params[:name], params[:email]).deliver
    redirect_to '/dashboard', notice: "#{@user.email} is now approved for volunteering as a TA"
  end
end
