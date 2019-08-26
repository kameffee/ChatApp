class PostsController < ApplicationController
  # 一覧表示
  def index
    @posts = Post.all
  end

  # 詳細表示
  def show
    @post = Post.find_by(id: params[:id])
  end
end
