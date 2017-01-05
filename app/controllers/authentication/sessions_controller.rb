module Authentication
  class SessionsController < Devise::SessionsController
    def create
      if valid_credentials?
        super
      else
        flash[:notice] = I18n.t("devise.failure.not_found_in_database")
        redirect_to(root_path) 
      end
    end

    private

    def valid_credentials?
      warden.authenticate(auth_options)
    end
  end
end