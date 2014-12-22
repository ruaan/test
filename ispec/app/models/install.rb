class Install < ActiveRecord::Base
  mount_uploader :image, PictureUploader



  has_many :installcategorizations
  has_many :products, through: :installcategorizations

  accepts_nested_attributes_for :installcategorizations
end
