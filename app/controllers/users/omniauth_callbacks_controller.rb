class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def meetup
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    # debugger
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Meetup") if is_navigational_format?
    else
      session["devise.meetup_data"] = request.env["omniauth.auth"]
      puts @user.errors
      redirect_to new_user_registration_url
    end
  end

  def failure
    redirect_to root_path
  end
end
