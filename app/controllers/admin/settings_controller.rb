class Admin::SettingsController < ApplicationController
  before_filter :authenticate
  before_filter :authenticate_admin
  layout 'admin/layout'
  
  def index
    @types_of_contract = TypeOfContract.all
    @types_of_house = TypeOfHouse.all
    @conditions = Condition.all
  end
##----------------------------------------------------------------------------##  
  def new_contract
    @type_of_contract = TypeOfContract.new
  end
  
  def save_contract
    @type_of_contract = TypeOfContract.new(params[:type_of_contract])
    if @type_of_contract.save
      redirect_to admin_settings_path, :flash => { :success => "Dato inserito" }
    else           
      flash.now[:error] = "Errore"
      render 'new_contract'
    end      
  end
##----------------------------------------------------------------------------##  
  def new_house
    @type_of_house = TypeOfHouse.new
  end
  
  def save_house
    @type_of_house = TypeOfHouse.new(params[:type_of_house])
    if @type_of_house.save
      redirect_to admin_settings_path, :flash => { :success => "Dato inserito" }
    else           
      flash.now[:error] = "Errore"
      render 'new_house'
    end      
  end
##----------------------------------------------------------------------------##  
  def new_condition
    @condition = Condition.new
  end
  
  def save_condition
    @condition = Condition.new(params[:condition])
    if @condition.save
      redirect_to admin_settings_path, :flash => { :success => "Dato inserito" }
    else           
      flash.now[:error] = "Errore"
      render 'new_condition'
    end      
  end  
  
end
