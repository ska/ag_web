class MessagesController < ApplicationController
  layout 'admin/layout'
  
  def index    
    @messages = current_user.messages.all
  end

  def show
    @message = Message.find(params[:id])
  end

  def new
    @message = Message.new
  end

  def edit
    @message = Message.find(params[:id])
  end

  def create
    #@message = @house.messages.new(params[:message])
    @house = House.find(params[:message][:house_id])
    @house.touch
    
    @message = @house.messages.new(params[:message])
    if @message.save
      redirect_to(@message, :success => 'Message was successfully created.')
    else
      render :action => "new"
    end
  end
  
  def update
    @message = Message.find(params[:id])

    if @message.update_attributes(params[:message])
      redirect_to(@message, :notice => 'Message was successfully updated.')        
    else
      render :action => "edit"       
    end
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    redirect_to(messages_url)        
  end
end
