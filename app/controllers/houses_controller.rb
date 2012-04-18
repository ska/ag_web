class HousesController < ApplicationController
  # GET /houses
  def index
    @houses = House.all
  end

  # GET /houses/1
  def show
    @house = House.find(params[:id])
  end

  # GET /houses/new
  def new
    @house = House.new
  end

  # GET /houses/1/edit
  def edit
    @house = House.find(params[:id])
  end

  # POST /houses
  def create
    @house = House.new(params[:house])
    if @house.save
      redirect_to @house, :flash => { :success => "Welcome to the Sample App!" }
    else
      render 'new'
    end
  end

  # PUT /houses/1
  def update
    @house = House.find(params[:id])
  end

  # DELETE /houses/1
  def destroy
    @house = House.find(params[:id])
    @house.destroy
  end
end
