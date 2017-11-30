class SiteController < BaseController
  skip_before_action :authenticate_user!
  before_action :redirect_if_signed_in

  def welcome
    render "welcome", layout: "landing"
  end

  def redirect_if_signed_in
    redirect_to acts_path if user_signed_in?
  end
end
