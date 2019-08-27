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
    @post = Post.new()
  end

  def create
    @post = Post.new(content: params[:content])
    if @post.save
      flash[:notice] = "投稿しました"
      # リダイレクト
      redirect_to("/posts/index")
    else
      render("posts/new")
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    # 取得
    @post = Post.find_by(id: params[:id])
    # 更新
    @post.content = params[:content]
    if @post.save
      # フラッシュメッセージ設定
      flash[:notice] = "投稿を編集しました"
      # リダイレクト
      redirect_to("/posts/index")
    else
      render("posts/edit")
    end
  end

  # 削除
  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to("/posts/index")
  end
end
