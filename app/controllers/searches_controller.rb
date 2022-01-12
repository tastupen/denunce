class SearchesController < ApplicationController
  def search
    @keyword = params[:keyword]
    @posts = []
    @keywords = @keyword.split(/[[:blank:]]+/)
    @keywords.each do |keyword|
      @posts += Post.where(["content like ?", "#{keyword}%"]).order(created_at: :desc)
    end
    @category = Category.search(params[:word]).order(created_at: :desc)
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
  
  private
    def post_params
      params.permit( :content, :status, :guest, :user_id, :category_id )
    end
end
