class LikesController < ApplicationController
  before_action :post_params
  
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

  def post_params
    @post = Post.find(params[:id])
  end
end