class Admin::UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    @user.guest = @guest.guest
    if @user.save
      @post = Post.where(guest: session[:guest])
      @post.each do |post|
        post.user_id = session[:user_id]
        post.save
      end
      redirect_to login_path, notice: "「#{@user.nickname}」を登録しました！ ログインしてください！"
    else
      render :new
    end
  end

  def show
    @posts = Post.where(user_id: @user.id).order(created_at: :desc)
    @likes = Like.where(user_id: @user.id).order(created_at: :desc)
    @categories = Category.all
  end

  def index
    @users = User.all
    @posts = Post.where(user_id: nil)
    @user = User.new
  end
  
  def edit
  end
  
  def update
    if @user.update(user_params)
      redirect_to admin_user_path(@user), notice: "ユーザ「#{@user.nickname}」を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    @post = Post.where(user_id: @user.id)
    if @post.present?
      @post.delete_all
    end
    @user.destroy
    reset_session
    redirect_to root_path, notice: "ユーザ「#{@user.nickname}」を削除しました。"
  end

  
  private
  
    def user_params
      params.require(:user).permit(:nickname, :email, :admin, :password, :password_confirmation)
    end
    
    def set_user
      @user = User.find(params[:id])
    end
end
