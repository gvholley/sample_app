class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
        log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        flash[:success] = "Logged in!"
        redirect_back_or root_url
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
