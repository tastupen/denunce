class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  before_action :createlogin
  
  def createlogin
    if session[:user_id].present?
      if session[:guest].nil?
        @current_user = User.find_by(id: session[:user_id])
      else
        @current_user = User.where(guest: session[:guest])
      end
    else
      @guest = User.new
      session[:guest] = DateTime.current.strftime('%m%d%H%M%S')
      @guest.guest = session[:guest]
      @guest.save
    end
  end
  
  private
    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end
end
