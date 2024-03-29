class AuthController < ApplicationController
  def callback
    auth = request.env['omniauth.auth']
    initialize_session!      auth
    initialize_current_user! auth
    redirect_to list_path
  end

  def failure
    redirect_to root_path , :flash => { :error => "Unable to authenticate -- please try again!" }
  end

  def logout
    reset_session
    redirect_to root_path
  end
private
  def initialize_current_user!( auth_data )
    current_user.twitter_oauth_token        = auth_data[ "credentials" ][ "token" ]
    current_user.twitter_oauth_token_secret = auth_data[ "credentials" ][ "secret" ]
    current_user.image_url                  = auth_data[ "extra" ][ "raw_info" ][ "profile_image_url" ]
    current_user.user_name                  = auth_data[ "info" ][ "nickname" ]
    current_user.save!
  end

  def initialize_session!( auth_data )
    session[ :auth_token ] = auth_data[ "credentials" ][ "token" ]
    session[ :email ]      = auth_data[ "info" ][ "email" ]
    session[ :user_id ]    = auth_data[ "uid" ]
  end
end
