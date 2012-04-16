class AuthenticatedController < ApplicationController
  before_filter :require_authentication_keys
private
  def require_authentication_keys
    redirect_to root_path unless session.include?( :user_id )
  end
end
