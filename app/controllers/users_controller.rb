class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      #raise @user.inspect
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Thank you for signing up!"
      #is that where we should send new users? recipe index?
    else
      flash[:notice] = "Error here"
      render 'new'

    end
  end


  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
