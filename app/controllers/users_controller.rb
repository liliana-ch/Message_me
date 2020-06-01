class UsersController < ApplicationController

def new
end

def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome to the Message-me #{@user.username}, you have successfully signed up"
      redirect_to login_path
    else
      render 'new'
    end
  end


end

private
  def user_params
    params.require(:user).permit(:username, :password)
  end
