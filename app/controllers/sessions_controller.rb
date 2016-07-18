class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(params[:session][:username],
                                     params[:session][:password])
    if @user.nil?
      flash.now[:errors] = "Invalid username and/or password!"
      render :new
    else
      login!(@user)
      redirect_to users_url
    end
  end

  def destroy
    logout!
    redirect_to new_session_url
  end
end
