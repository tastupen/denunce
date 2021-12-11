class GoodsController < ApplicationController
  def good
    @posts = Post.status_public.order("RANDOM()").limit(5)
    @categories = Category.all
  end
end
