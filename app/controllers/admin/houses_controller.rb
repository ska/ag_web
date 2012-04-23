class Admin::HousesController < ApplicationController
  layout 'admin/layout'
  def index
    @houses = House.all
  end
  
  def user    
    @user = User.find(params[:id])
    @houses = @user.houses    
    render :template => 'admin/houses/index'
  end

  def show
    @house = House.find(params[:id])
    @message = Message.new
  end
  
  
  
  
  #----------------------------------------------------------------------------
  # GET /houses/new
  def new
    @house = House.new
  end
  # POST /houses
  def create     
    @house = current_user.houses.build(params[:house])
    if @house.save
      redirect_to admin_houses_path(@house), :flash => { :success => "Casa inserita nel database!"}
    else
      render 'new'
    end
  end
  #----------------------------------------------------------------------------
  # GET /houses/1/edit
  def edit
    @house = House.find(params[:id])
  end
  # PUT /houses/1
  def update
    @house = House.find(params[:id])
    if @house.update_attributes(params[:house])
      redirect_to @house, :flash => { :success => "Modifica avvenuta con successo!"}
    else
      render 'new'
    end
  end

  
  
  
  
  # DELETE /houses/1
  def destroy
    @house = House.find(params[:id])
    @house.destroy
    redirect_to houses_path
  end
end
