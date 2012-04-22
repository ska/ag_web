class MessagesController < ApplicationController
  layout 'admin/layout'
  
  def index    
    @messages = current_user.messages.all
  end

  def show
    @message = Message.find(params[:id])
    @message.read = true
    @message.save    
  end

  def new
    @message = Message.new
  end

  def create
    @house = House.find(params[:message][:house_id])
    @user = User.find(@house.user_id)
    
    @message = @user.messages.new(params[:message])
    if @message.save
      redirect_to(@house, :error => 'Message was successfully created.')
    else
      render :action => "new"
    end
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    redirect_to(messages_url)        
  end
end
