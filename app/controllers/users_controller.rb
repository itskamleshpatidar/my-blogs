class UsersController < ApplicationController
  
  def new; end

  def create
    user = User.new(user_params)

    if user.save
      session[:user_id] = user.id
      redirect_to root_path, notice: 'User created successfully'
    else
      flash[:alert] = user.errors.full_messages.join(', ')
      render :new
    end
  end

  private

  def user_params
    params.permit(:email, :name, :password, :password_confirmation)
  end
end
