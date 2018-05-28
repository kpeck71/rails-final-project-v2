class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      #raise @user.inspect
      session[:user_id] = @user.id
      redirect_to root_path
      flash[:notice] =  "Thank you for signing up!"
      #is that where we should send new users? recipe index?
    else
      flash[:error] = @user.errors.full_messages
      render 'new'
    end
  end


  def recipes
    @user = User.find(params[:user_id])
  end

  def show
    @user = User.find(params[:id])
  end


  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
