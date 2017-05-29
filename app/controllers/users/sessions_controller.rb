class Users::SessionsController < Devise::SessionsController
  protected
    def after_resetting_password_path_for(resource)
      dashboard_path
    end
end
