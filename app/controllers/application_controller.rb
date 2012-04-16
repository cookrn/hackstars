class ApplicationController < ActionController::Base
  protect_from_forgery
protected
  def current_user
    @current_user ||= User.find_or_create_by :uid => session[ :user_id ] unless session[ :user_id ].blank?
  end
  helper_method :current_user

  def current_user?
    current_user.present?
  end
  helper_method :current_user?
end
