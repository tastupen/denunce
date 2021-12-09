class SessionsController < ApplicationController
  def new
    @post = Post.new
    @categories = Category.all
  end
  
  def create
    user = User.find_by(email: session_params[:email])
    
    if user&.authenticate(session_params[:password])
      session[:user_id] = user.id
      @post = Post.where(guest: session[:guest])
      @post.each do |post|
        post.user_id = session[:user_id]
        post.save
      end
      redirect_to root_path, notice: 'ログインしました'
    else
      redirect_to login_path, alert: "ログインできませんでした"
    end
  end
  
  def destroy
    reset_session
    redirect_to root_url notice: 'ログアウトしました'
  end
  
  def edit
    @categories = Category.all
  end
  
  def update
    @user = User.find(params[:id])
    
    if @user.update
      redirect_to root_path
    else
    end
  end
  
  
  private
    def session_params
      params.require(:session).permit(:nickname, :email, :password, :guest)
    end
    
end
