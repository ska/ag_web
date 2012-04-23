class Admin::SessionsController < ApplicationController
  #before_filter :authenticate, :only => [:destroy]
  def new
    if signed_in?
      redirect_to admin_user_path(current_user)
    end
  end
  
  def create
    user = User.authenticate(params[:session][:email], 
                             params[:session][:password])    
    if user.nil?
      flash.now[:error] = "Errore coppia E-mail, password sbagliata."
      render 'new'
    else
      sign_in user
      redirect_to admin_user_path(user), :success => "Login avvenuto con succeso."
    end    
  end
  
  def destroy
    sign_out
    redirect_to admin_signin_path, :notice => "Logout avvenuto con succeso."
  end
end
