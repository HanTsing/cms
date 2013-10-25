class UsersController < ApplicationController

  def index
    @users = User.page(params[:page])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]
    if @user.update_attributes(params[:user])
      flash[:success] = t("user.success")
      redirect_to user_url(@user)
    else
      render :action => "edit" 
    end
  end

  def show
    @user = User.find params[:id]
  end

  def create
    @user = User.new(params[:user])
    encrypt_new = ::BCrypt::Password.create(params[:user][:password]).to_s
    @user.encrypted_password = encrypt_new

    if @user.save
      flash[:success] = t("user.success")
      redirect_to user_url(@user)
    else
      render :action => "new"
    end

  end

  def destroy
  end

end
