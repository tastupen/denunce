class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]
  
  def index
    @posts = Post.status_public.order(created_at: :desc)
    @categories = Category.all
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

  def edit
    @categories = Category.all
  end

  def update
    if @post.update(post_params)
      redirect_to edit_post_path, notice: "アップデートに成功しました"
    else
      redirect_to "edit", alert: "アップデートに失敗しました"
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path, notice: "削除しました"
  end
  
  private
    def set_post
      @post = Post.find(params[:id])
    end
  
    def post_params
      params.permit( :content, :status, :guest, :user_id, :category_id )
    end
end
