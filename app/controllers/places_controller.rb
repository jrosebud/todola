class PlacesController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create]

  def index
    @areas = Area.all
    @places = Place.all
  end
  
  def new
    @place = Place.new
  end
  
  def create
    @place = Place.new place_params
    @place.user = current_user
    
    if @place.save
      redirect_to places_path
    else
      render :new
    end
  end
  
  def show
    @place = Place.find params[:id]
  end
  
  private
  
  def place_params
  params.require(:place).permit(:name, :address, :city, :state, :zip, :phone, :website, :days, :open, :close, :days2, :open2, :close2, :area_id, :image, :category_id)
  end

end
