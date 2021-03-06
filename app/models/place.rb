class Place < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  belongs_to :area
  
  mount_uploader :image, PhotoUploader
  
  validates_presence_of :name, :address, :city, :state, :zip
  
  def self.search(query)
    Place.where("area_id::text LIKE :query", query: "%#{query}%")
  end
end