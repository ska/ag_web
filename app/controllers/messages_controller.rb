class MessagesController < ApplicationController  
  def create
    @house = House.find(params[:message][:house_id])
    user = User.find(@house.user_id)    
    @message = user.messages.new(params[:message])
    
    if @message.save
      redirect_to house_page_path(@house), :notice => 'Messaggio inviato.'
    else
      redirect_to house_page_path(@house), :error => 'Errore salvataggio messaggio'
    end
  end

end
