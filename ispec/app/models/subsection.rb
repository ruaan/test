class Subsection < ActiveRecord::Base
  has_many :globals
  belongs_to :section
  has_many :categorizations
  has_many :products, :through => :categorizations
  #accepts_nested_attributes_for :categorizations

  has_many :lineitemscatagorizations, :class_name => 'Lineitemscatagorizations'
  has_many :lineitems, :through => :lineitemscatagorizations


  accepts_nested_attributes_for :lineitemscatagorizations
  #has_and_belongs_to_many :products
end
