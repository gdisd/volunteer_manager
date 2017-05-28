class Users::SessionsController < Devise::SessionsController
  protected
    def after_resetting_password_path_for(resource)
      signed_in_root_path(resource)
    end
end
