class PlacesController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @places = Place.all
    @place = Place.new
  end
  
  def search
    @place = Place.new
    @places = Place.search params[:place][:area_id]
  end
  
  def new
    @place = Place.new
  end
  
  def create
    @place = Place.new place_params
    @place.user = current_user
    
    if @place.save
      render :show
    else
      render :new
    end
  end
  
  def show
    @place = Place.find params[:id]
  end
  
  def edit
    @place = Place.find params[:id]
  end
  
  def update
    place = Place.find params[:id]
    place.update_attributes place_params
    
    redirect_to place_path(place)
  end
  
  def destroy
    Place.find(params[:id]).destroy
    
    redirect_to places_path, flash: { success: "Listing was deleted." }
  end
  
  def self.time_range
    open = Place.open
    close = Place.close
    open2 = Place.open2
    close2 = Place.close2
    Place.where( ('open > Time.now AND close < Time.now') OR ('open2 > Time.now and close2 < Time.now'), open, close, open2, close2).limit(4)
  end
  
  private
  
  def place_params
  params.require(:place).permit(:name, :address, :city, :state, :zip, :phone, :website, :days, :open, :close, :days2, :open2, :close2, :area_id, :image, :description, :category_id)
  end

end
