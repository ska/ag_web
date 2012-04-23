class UsersController < ApplicationController
  before_filter :authenticate, :only => [ :show ]
  before_filter :authenticate_admin, :only => [:index, :admin_edit, :admin_update]
  before_filter :enabled_user, :only => [:edit, :update]
  layout 'admin/layout'
  
  ##--------------- NESSUN FILTRO ---------------##
  def new
    @user = User.new
    render :layout => 'application'
  end
  
  def create   
    params[:user].delete(:admin)
    params[:user].delete(:enabled)
    @user = User.new(params[:user])
    if @user.save 
      sign_in @user
      redirect_to @user, :flash => { :success => "User ok." }
    else      
      flash.now[:error] = "Errore"
      render 'new'
    end
  end
  
  ##--------------- FILTRO ADMIN ---------------##
  def index    
    #render :layout => 'admin/layout'
    @users = User.all
  end
  
  def admin_edit
    @user = User.find(params[:id])
  end
  
  def admin_update
    @user = User.find(params[:id])
    
    if @user.update_attributes(params[:user])
      redirect_to users_path, :flash => { :success => "Profile updated." }
    else
      render 'edit' #, :layout => 'admin_layout'      
    end
  end
  
  ##--------------- FILTRO ENABLED ---------------##
  def edit
    @user = User.find(params[:id])
  end
  
  def update    
    params[:user].delete(:admin)
    params[:user].delete(:enabled)
    @user = User.find(params[:id])
    
    if @user.update_attributes(params[:user])
      redirect_to users_path, :flash => { :success => "Profile updated." }
    else
      render 'edit' #, :layout => 'admin_layout'      
    end
  end
  
  ##--------------- FILTRO AUTHENTICATE ---------------##
  
  def show
    @user = User.find(params[:id])    
  end
  
  
end
