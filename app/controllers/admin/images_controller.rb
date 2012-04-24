class Admin::ImagesController < ApplicationController
  before_filter :authenticate
  
  layout 'admin/layout'
  
  def new
    @image = Image.new(:house_id => params[:house_id])
  end

  def create
    @image = Image.new(params[:image])
    if @image.save
      flash[:success] = "Immagine caricata con successo."
      redirect_to admin_house_path(@image.house)
    else
      render :action => 'new'
    end
  end
  
  
  
  
  
  
  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    flash[:notice] = "Immagine cancellata con successo."
    redirect_to admin_house_path(@image.house)
  end
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  

end
