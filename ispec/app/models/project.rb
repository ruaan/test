class Project < ActiveRecord::Base
  belongs_to :account
  has_many :sections
  belongs_to :user

end
