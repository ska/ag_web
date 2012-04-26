class Admin::HousesController < ApplicationController
  before_filter :authenticate
  before_filter :authorized_user, :only => [ :destroy, :edit, :update ]
  layout 'admin/layout'
  ##--------------- NESSUN FILTRO ---------------##  
  def index
    @houses = House.paginate(:page => params[:page], :per_page => 10)
  end
  
  def user    
    @user = User.find(params[:id])
    @houses = @user.houses.paginate(:page => params[:page], :per_page => 10)    
    render :template => 'admin/houses/index'
  end

  def show
    @house = House.find(params[:id])
    @messages = @house.messages
    @contract = TypeOfContract.find(@house.id_TypeOfContract).name
    @tipo_casa = TypeOfHouse.find(@house.id_TypeOfHouse).name
    @condizioni = Condition.find(@house.id_Condition).name
  end
  
  ##--------------- FILTRO ENABLED ---------------##
  def new
    @house = House.new
  end
  
  def create     
    @house = current_user.houses.build(params[:house])
    if @house.save
      redirect_to admin_house_path(@house), :flash => { :success => "Casa salvata"}
    else
      render 'new'
    end
  end
  
  ##--------------- FILTRO Admin o proprietario ---------------##
  def edit
    # la variabile @house viene prodotta da authorized user
  end
  
  def update    
    if @house.update_attributes(params[:house])
      redirect_to admin_house_path(@house), :flash => { :success => "Modifica avvenuta con successo"}
    else
      render 'new'
    end
  end

  def destroy
    @house.destroy
    redirect_to admin_houses_path, :flash => { :success => "Casa eliminata"}
  end
  
  private
    def authorized_user
      if current_user.admin?
        #sono admin posso cancellare/modificare la casa
        @house = House.find_by_id(params[:id])
      else
        #Non sono admin, devo verificare se sono il proprietario della casa
        @house = current_user.houses.find_by_id(params[:id])
        if @house.nil?
          redirect_to admin_houses_path
        end
      end     
    end
  
  
  
  
  
  
end
