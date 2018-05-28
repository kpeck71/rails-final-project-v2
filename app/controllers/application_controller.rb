class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :logged_in?, :current_user

   def logged_in?
     session.has_key? :user
   end

   def current_user
     Marshal.load session[:user] if logged_in?
   end
   # def authorize
   #   redirect_to login_url, alert: "Not authorized" if current_user.nil?
   # end

end
