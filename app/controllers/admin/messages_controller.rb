class Admin::MessagesController < ApplicationController
  before_filter :authenticate_admin, :only => [ :admin_index, :user_index ]
  layout 'admin/layout'
  
  def index    
    @messages = current_user.messages.all
  end

  def admin_index    
    @messages = Message.all
    render :template => 'admin/messages/index'
  end
  
  def user_index   
    @user = User.find(params[:id])
    @messages = @user.messages
    render :template => 'admin/messages/index'
  end
  
  
  
  def show
    @message = Message.find(params[:id])
    unless authorized_user
      redirect_to admin_messages_path, :flash => { :error => "Non puoi leggere questo messaggio"}
    end    
    @message.read = true
    @message.save    
  end

  def destroy
    @message = Message.find(params[:id])
    if authorized_user
      @message.destroy
      redirect_to admin_messages_path, :flash => { :success => "Messaggio eliminato"}
    else
      redirect_to admin_messages_path, :flash => { :error => "Impossibile eliminare il messaggio"}
    end
  end
  
  private
    def authorized_user
      if current_user.admin?
        #Utente admin, puo' fare tutto
        return true
      else
        #per fare qualcosa devo essere proprietario della casa a cui e' associata la foto
        return @message.user == current_user
      end
    end
  
  
  
  
  
  
end
