class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def new
  end

  def create
    @user = User.new(
      name: params[:name],
      email: params[:email],
      image_name: "default_user.jpg")
    @user.save

    redirect_to("/users/#{@user.id}")
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.name = params[:name]
    @user.email = params[:email]

    # アイコンの保存
    if params[:image]
      image = params[:image]
      @user.image_name = "#{@user.id}.jpg"
      File.binwrite("public/user_image/#{@user.id}.jpg", image.read)
    end

    if @user.save
      flash[:notice] = "編集に成功しました"
      redirect_to("/users/#{@user.id}")
    else
      render("users/edit")
    end
  end
  
  def login_form
  end

  # ログイン処理
  def login
    @user = User.find_by(email: params[:email], password: params[:password])

    if @user
      flash[:notice] = "ログインしました"
      redirect_to("/posts/index")
    else
      render("users/login_form")
    end
  end

end
