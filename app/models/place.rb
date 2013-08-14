class Place < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  belongs_to :area
  
  mount_uploader :image, PhotoUploader
  
  validates_presence_of :name
end