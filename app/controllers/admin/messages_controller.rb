class Admin::MessagesController < ApplicationController
  layout 'admin/layout'
  
  def index    
    @messages = current_user.messages.all
  end

  def show
    @message = Message.find(params[:id])
    @message.read = true
    @message.save    
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    redirect_to(messages_url)        
  end
end
