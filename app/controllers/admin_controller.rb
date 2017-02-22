class AdminController < ApplicationController
  before_action :check_status

  def show
    @users=User.all
  end

  private

  def check_status
    if !session[:user_id]
      redirect_to '/users/new'
    end
  end
end
