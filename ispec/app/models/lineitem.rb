class Lineitem < ActiveRecord::Base
  mount_uploader :image, PictureUploader
  has_many :lineitemscatagorizations, :class_name => 'Lineitemscatagorizations'
  has_many :subsections, :through => :lineitemscatagorizations



  accepts_nested_attributes_for :lineitemscatagorizations


end
