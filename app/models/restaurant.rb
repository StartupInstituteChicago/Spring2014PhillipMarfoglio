class Restaurant < ActiveRecord::Base
  validates :name, :description, :address, :phone_number, presence:true
  validates :name, :address, length: { minimum: 4 }
  validates :phone_number, length: { minimum: 10 }
  validates :owner, :presence => true
#  attr_accessible :restaurant_id, :name, :photo, :remote_photo_url
  belongs_to :owner
  has_many :reservations, :dependent => :destroy
  accepts_nested_attributes_for :reservations

  has_and_belongs_to_many :categories

  mount_uploader :photo, PhotoUploader
end
