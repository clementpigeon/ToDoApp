class UsersController < ApplicationController

  def index
    @users = User.all
    render :index
  end


  def show
    @user = User.find(params[:id])
    render :show
  end


  def new
    @user = User.new
    render :new
  end


  def edit
    @user = User.find(params[:id])
    render :edit
  end


  def create
    @user = User.new(params[:user])

    if @user.save
      redirect_to @user, notice: 'User was successfully created.'
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end


  def update
    @user = User.find(params[:id])

    if @user.update_attributes(params[:user])
      redirect_to @user, notice: 'User was successfully updated.'
    else
      flash.now[:errors] = @user.errors.full_messages
      render :update
    end
  end


  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to users_url
  end
end
