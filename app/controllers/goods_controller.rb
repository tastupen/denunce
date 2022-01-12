class GoodsController < ApplicationController
  def good
    @posts = Post.status_public.order("RANDOM()").limit(5)
    @categories = Category.all
  end
  
  def create
    @post = Post.new(post_params)
    
    respond_to do |format|
      if @post.save
        format.js { flash.now[:notice] = "投稿に成功しました" }
      else
        @false = "投稿に失敗しました"
      end
    end
  end
  
  private
    def post_params
      params.permit( :content, :status, :guest, :user_id, :category_id )
    end
end
