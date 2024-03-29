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
    @user = User.new(name: params[:name], email: params[:email])
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
    if @user.save
      flash[:notice] = "編集に成功しました"
      redirect_to("/users/#{@user.id}")
    else
      render("users/edit")
    end
  end

end
