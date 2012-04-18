class SessionsController < ApplicationController
  def new
    if signed_in?
      redirect_to current_user
    end
  end
  
  def create
    user = User.authenticate(params[:session][:email], 
                             params[:session][:password])    
    if user.nil?
      flash.now[:error] = "errore Uname psw"
      render 'new'
    else
      sign_in user
      redirect_to user, :success => "Login avvenuto con succeso."
    end    
  end
  
  def destroy
    sign_out
    redirect_to signin_path, :notice => "Logout avvenuto con succeso."
  end
end
