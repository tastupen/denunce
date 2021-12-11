class SearchesController < ApplicationController
  def search
    @posts = Post.search(params[:word]).order(created_at: :desc)
    @category = Category.search(params[:word]).order(created_at: :desc)
    @categories = Category.all
  end
end
