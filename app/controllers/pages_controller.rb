class PagesController < ApplicationController
  def index
    @title = 'Elenco case'
    @houses = ''
    if params[:post].nil?
      @houses = House.paginate(:page => params[:page], :per_page => 3)
    else
      @houses = House.search( params ).paginate(:page => params[:page], :per_page => 3)
    end    
  end

  def house
    @house = House.find(params[:id])
    @message = Message.new
    @title = @house.titolo
  end
  
  def chi_siamo
    
  end
  
end
