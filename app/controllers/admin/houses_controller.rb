class Admin::HousesController < ApplicationController
  before_filter :authenticate
  before_filter :authorized_user, :only => [ :destroy, :edit, :update ]
  layout 'admin/layout'
  ##--------------- NESSUN FILTRO ---------------##  
  def index
    @houses = House.all
  end
  
  def user    
    @user = User.find(params[:id])
    @houses = @user.houses    
    render :template => 'admin/houses/index_user'
  end

  def show
    @house = House.find(params[:id])
    @message = Message.new
  end
  
  ##--------------- FILTRO ENABLED ---------------##
  def new
    @house = House.new
  end
  
  def create     
    @house = current_user.houses.build(params[:house])
    if @house.save
      redirect_to admin_house_path(@house), :flash => { :success => "Casa inserita nel database!"}
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
      redirect_to admin_house_path(@house)
    else
      render 'new'
    end
  end

  def destroy
    @house.destroy
    redirect_to admin_houses_path
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
      
#      def redirect_after_update
#        if current_user.admin?
#          redirect_to admin_houses_path, :flash => { :success => "Modifica avvenuta con successo!"}
#        else
#          redirect_to user_admin_house_path(current_user), :flash => { :success => "Modifica avvenuta con successo!"}
#        end
#      end
      
    end
  
  
  
  
  
  
end
