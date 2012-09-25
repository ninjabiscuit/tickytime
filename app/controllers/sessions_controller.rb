class SessionsController < ApplicationController

  def create

    #raise request.env["omniauth.auth"].to_yaml

    auth = request.env["omniauth.auth"]
    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]).tap do |u|
      u.update_attributes(:token => auth["credentials"]["token"]) if u
    end || User.create_with_omniauth(auth)

    session[:user_id] = user.id
    redirect_to root_url, :notice => "Signed in!"
  end

  def destroy
    sign_out("Signed out!")
  end

end