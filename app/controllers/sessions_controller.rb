class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url
    else
      #need error message
      #flash.now.alert = "Email or password is invalid"
      flash[:notice] = "User not correct or not found"
      render 'new'
    end
  end

  def destroy
    reset_session
    redirect_to root_url, notice: "Logged out!"
  end

end
