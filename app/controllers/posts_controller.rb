class PostsController < ApplicationController
  # 一覧表示
  def index
    @posts = Post.all.order(created_at: :desc)
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

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    # 取得
    @post = Post.find_by(id: params[:id])
    # 更新
    @post.content = params[:content]
    @post.save
    # リダイレクト
    redirect_to("/posts/index")
  end

end
