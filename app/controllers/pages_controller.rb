class PagesController < ApplicationController
  def home
    @houses = House.all
  end
  
  def house
    #@house = House.
  end

  def about
  end

end
