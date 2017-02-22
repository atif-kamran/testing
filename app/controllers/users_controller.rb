class UsersController < ApplicationController

  def index
  end

  def new

  end

  def show
    @user=User.find(params[:id])
  end

  def edit
    @user=User.find(params[:id])
  end

  def create
    user= User.new(name: params[:name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    if !user.valid?
      flash[:error] = "You have errors"
      redirect_to '/users/new'
    else
      flash[:success] = "You did it!"
      User.create(name: params[:name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
      redirect_to '/users/new'
    end
  end

  def login
    user= User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user[:id]
      redirect_to '/users'
    else
      render text: "Something was wrong with Login credentials"
    end
  end

  def logout
    session.clear
    redirect_to '/users/new'
  end

  def update
    User.find(params[:id]).update(name: params[:name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    redirect_to "/users"
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to "/users"
  end



end
