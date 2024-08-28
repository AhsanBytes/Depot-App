class SessionsController < ApplicationController
  skip_before_action :authorize
  def new
  end

  def create
    user = User.find_by(name: params[:name])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      Rails.logger.debug "Session user_id set to: #{session[:user_id]}" # Add this line for debugging
      redirect_to admin_url
    else
      Rails.logger.debug "Login failed for user: #{params[:name]}" # Add this line for debuggingf
      redirect_to login_url, alert: "Invalid user/password combination"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to store_index_url, notice: "Logged out"
  end
end
