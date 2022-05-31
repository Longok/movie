class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by email: params[:session][:email].downcase
    if user &.authenticate(params[:session][:password])
      flash[:info] = 'ok'

      log_in user
      redirect_to user
    else
      flash[:danger] = 'Invalid email/password combination'
      render :new
    end
  end


  def destroy
    log_out
    redirect_to root_url
  end
    

end
