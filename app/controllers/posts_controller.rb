class PostsController < ApplicationController
  before_action :authenticate_user
  before_action :ensure_correct_user, {only: [:edit, :update, :destroy]}

  # 一覧表示
  def index
    @posts = Post.all.order(created_at: :desc)
  end

  # 詳細表示
  def show
    @post = Post.find_by(id: params[:id])
    @user = @post.user

    @likes_count = Like.where(post_id: @post.id).count
  end

  # 新規投稿
  def new
    @post = Post.new()
  end

  def create
    @post = Post.new(
      content: params[:content],
      user_id: @current_user.id
      )

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

  def ensure_correct_user
    @post = Post.find_by(id: params[:id])
    if @post.user.id != @current_user.id
      flash[:notice] = "権限がありません"
      redirect_to("/posts/index")
    end
  end
end
