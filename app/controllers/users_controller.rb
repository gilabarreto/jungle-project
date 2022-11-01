class UsersController < ApplicationController
  def new
  end

  def create
    user = User.new({ first_name: user_params[:first_name],
                     last_name: user_params[:last_name],
                     email: user_params[:email],
                     password: user_params[:password] })
    if user.save
      session[:user_id] = user.id
      redirect_to "/"
    else
      redirect_to "/signup"
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
