class SessionsController < ApplicationController
  def new

  end

  def create_with_facebook
   user = User.find_or_create_by(:uid => auth['uid']) do |user|
     user.name = auth['info']['name']
   end
     session[:user_id] = user.try(:id)
  end

  def auth
    request.env['omniauth.auth']
  end
   # @user = User.from_omniauth(auth)
   #   if @user
   #     session[:user_id] = @user.id
   #     redirect_to user_path(@user)
   #   @user = User.find_or_create_by(uid: auth['uid']) do |u|
   #      u.name = auth['info']['name']
   #      u.email = auth['info']['email']
   #   end
   # end
   #
   #  session[:user_id] = @user.id
   #   # else
   #   #   redirect_to '/login', flash[:notice] = "Oops, something went wrong here. Please try again."
   #   # end
   #end

   # def create_with_google
   #   @user = User.from_omniauth(auth)
   #     if @user
   #       session[:user_id] = @user.id
   #       redirect_to user_path(@user)
   #     end
   #   # @user = User.find_or_create_by(uid: auth['uid']) do |u|
   #   #    u.name = auth['info']['name']
   #   #    u.email = auth['info']['email']
   #   #  end
   #
   #    #session[:user_id] = @user.id
   # end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url
    else
      flash[:error] = "User not correct or not found"
      render 'new'
    end
  end

  def destroy
    reset_session
    redirect_to root_url
    flash[:alert] = "Logged out!"
  end

private

  def auth
    request.env['omniauth.auth']
  end

end
