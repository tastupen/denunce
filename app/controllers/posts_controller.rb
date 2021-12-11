class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]
  
  def index
    @posts = Post.display_list(category_params, status)
    @categories = Category.all
    @category = Category.request_category(category_params)
    @likesuser = User.find_by(id: session[:user_id])
  end

  def show
  end

  def new
    @post = Post.new
    @categories = Category.all
  end

  def create
    @post = Post.new(post_params)
    
    if @post.save
      redirect_to root_path, notice: "投稿に成功しました"
    else
      redirect_to new_post_path, alert: "投稿に失敗しました"
    end
  end

  def destroy
    @post.destroy
    redirect_to admin_user_path(session[:user_id]), notice: "削除しました"
  end
  
  def category_params
    params[:category].present? ? params[:category]
                               : "none"
  end
  
  private
    def set_post
      @post = Post.find(params[:id])
    end
  
    def post_params
      params.permit( :content, :status, :guest, :user_id, :category_id )
    end
    
    def update_params
      params.require(:post).permit(:content, :status, :guest, :user_id, :category_id)
    end
end
