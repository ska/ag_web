class Admin::ImagesController < ApplicationController
  before_filter :authenticate  
  
  layout 'admin/layout'
  
  def new
    
    @image = Image.new(:house_id => params[:house_id])
  end

  def create
    @image = Image.new(params[:image])
    if authorized_user
      if @image.save
        flash[:success] = "Immagine caricata con successo."
        redirect_to admin_house_path(@image.house)
      else
        render :action => 'new'     
      end
    else
      flash[:error] = "Impossibile salvare immagine."
      redirect_to admin_house_path(@image.house)
    end
  end
  
  def destroy
    @image = Image.find(params[:id])
    if authorized_user
      @image.destroy
      flash[:success] = "Immagine cancellata con successo."
      redirect_to admin_house_path(@image.house)
    else 
      flash[:error] = "Impossibile cancellare immagine."
      redirect_to admin_house_path(@image.house)
    end
  end
  
  private
    def authorized_user
      if current_user.admin?
        #Utente admin, puo' fare tutto
        return true
      else
        #per fare qualcosa devo essere proprietario della casa a cui e' associata la foto
        return House.find(@image.house_id).user == current_user
      end
    end
  
  
end
