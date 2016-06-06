class SessionsController < ApplicationController
  def portal
  end

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash.now[:error] = "Your password or email are invalid"
      render :new
    end
  end

  def delete
    session.clear
    redirect_to login_path
  end

end
