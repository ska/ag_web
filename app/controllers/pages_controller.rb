class PagesController < ApplicationController
  require 'will_paginate/array'
  def index
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
    @contract = TypeOfContract.find(@house.id_TypeOfContract).name
    @tipo_casa = TypeOfHouse.find(@house.id_TypeOfHouse).name
    @condizioni = Condition.find(@house.id_Condition).name
  end

end
