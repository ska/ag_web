class Admin::UsersController < ApplicationController
  before_filter :authenticate, :except => [ :new, :create ]
  before_filter :enabled_user, :only => [ :edit, :update ]
  before_filter :authenticate_admin, :only => [ :index, :admin_edit, :admin_update ]
  
  layout 'admin/layout'
  
  ##--------------- NESSUN FILTRO ---------------##
  def new
    @title = "Registrazione utente"
    @user = User.new
    render :layout => 'admin/layout_hosidebar'
  end
  
  def create   
    params[:user].delete(:admin)
    params[:user].delete(:enabled)
    @user = User.new(params[:user])
    if @user.save 
      sign_in @user
      redirect_to @user, :flash => { :success => "Registrazione utente avvenuta con successo." }
    else      
      flash.now[:error] = "Errore"
      render 'new'
    end
  end
  
  ##--------------- FILTRO ADMIN ---------------##
  def index
    @title = "Lista completa utenti"
    @users = User.all
  end
  
  def edit_permission
    @user = User.find(params[:id])
    @title = "Abilitazione utente #{@user}"
  end
  
  def update_permission
    @user = User.find(params[:id])    
    if @user.update_attributes(params[:user])
      redirect_to admin_users_path, :flash => { :success => "Profile updated." }
    else
      render 'edit' #, :layout => 'admin_layout'      
    end
  end
  
  ##--------------- FILTRO ENABLED ---------------##
  def edit
    @user = User.find(params[:id])
    @title = "Modifica utente #{@user}"
  end
  
  def update    
    params[:user].delete(:admin)
    params[:user].delete(:enabled)
    @user = User.find(params[:id])
    
    if @user.update_attributes(params[:user])
      redirect_to admin_user_path(@user), :flash => { :success => "Profile updated." }
    else
      render 'edit' #, :layout => 'admin_layout'      
    end
  end
  
  ##--------------- FILTRO AUTHENTICATE ---------------##
  
  def show
    @user = User.find(params[:id])    
  end
  
end
