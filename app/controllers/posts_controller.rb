class PostsController < ApplicationController
  # 一覧表示
  def index
    @posts = Post.all
  end

  # 詳細表示
  def show
    @post = Post.find_by(id: params[:id])
  end

  # 新規投稿
  def new
    
  end

  def create
    @post = Post.new(content: params[:content])
    @post.save
    # リダイレクト
    redirect_to("/posts/index")
  end
end
