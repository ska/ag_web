class UsersController < ApplicationController
  before_filter :authenticate, :only => [:index, :show]
  before_filter :authenticate_admin, :only => [:index]
  before_filter :enabled_user, :except => :show
  def index    
    @users = User.all
    render :layout => 'admin_layout'
  end
  
  def show
    @user = User.find(params[:id])
    render :layout => 'admin_layout'
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save 
      sign_in @user
      redirect_to users_path, :flash => { :success => "User ok." }
    else      
      flash.now[:error] = "Errore"
      render 'new'
    end
    
  end    
  
  def edit
    @user = User.find(params[:id])
    render :layout => 'admin_layout'
  end
  
  def update
    @user = User.find(params[:id])
    
    if @user.update_attributes(params[:user])
      redirect_to users_path, :flash => { :success => "Profile updated." }
    else
      render 'edit', :layout => 'admin_layout'      
    end
  end
  
end
