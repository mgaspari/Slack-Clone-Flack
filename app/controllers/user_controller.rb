class UserController < ApplicationController

  def home
    if session[:current_user_id]
      @message = Message.new
      @user = User.find(session[:current_user_id])
      # binding.byebug
      render 'home'
    else
      redirect_to login_path
    end
  end

  def login
  end

  def logout
    session[:current_user_id] = nil
    redirect_to login_path
  end

  def show
    @user = User.find_by(username: params[:username], password: params[:password])
    if @user
      session[:current_user_id] = @user.id
      redirect_to home_path
    else
      redirect_to login_path
    end
  end

  def signup
    @user = User.new
  end

  def create
    @user = User.new
    @user.username = params[:user][:username]
    @user.password = params[:user][:password]
    @user.save
    session[:current_user_id] = @user.id
    redirect_to home_path
  end

end
