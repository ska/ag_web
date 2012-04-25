class PagesController < ApplicationController
  def home
    #@houses = House.all
    @houses = House.paginate(:page => params[:page], :per_page => 3)
  end
  
  def house
    #@house = House.
  end

  def about
  end

end
