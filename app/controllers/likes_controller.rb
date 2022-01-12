class LikesController < ApplicationController
  before_action :likes_params, only: [:create, :destroy]
  
  def index
    @posts = Post.find(Like.group(:post_id).order('count(post_id) desc').pluck(:post_id))
    @categories = Category.all
  end
  
  def post_create
    @post = Post.new(post_params)
    
    respond_to do |format|
      if @post.save
        format.js { flash.now[:notice] = "投稿に成功しました" }
      else
        @false = "投稿に失敗しました"
      end
    end
  end
  
  def create
    if session[:user_id].present?
      Like.create(user_id: session[:user_id] , post_id: params[:id])
    else
      redirect_to login_path, alert: "ログインしてください！登録されていない方はサインインしてください！！"
    end
  end
  
  def destroy
    if session[:user_id].present?
      Like.find_by(user_id: session[:user_id], post_id: params[:id]).destroy
    else
      redirect_to login_path, alert: "ログインしてください！登録されていない方はサインインしてください！！"
    end
  end
  
  private

  def likes_params
    @post = Post.find(params[:id])
  end
  
  def post_params
    params.permit( :content, :status, :guest, :user_id, :category_id )
  end
end