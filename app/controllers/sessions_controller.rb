class SessionsController < ApplicationController

  # should add the following for practice, to disable CSRF protection, according to Codecademy ??
  # skip_before_action :verify_authenticity_token

  def new
  end

  def create
    @user = User.find_by_email(params[:session][:email])
   if @user && @user.authenticate(params[:session][:password])
     session[:user_id] = @user.id
     redirect_to '/'
   else
     redirect_to '/login'
   end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end

end
