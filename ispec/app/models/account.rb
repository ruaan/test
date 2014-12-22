class Account < ActiveRecord::Base
  has_many :projects
  belongs_to :user

  def self.search(query)
# where(:title, query) -> This would return an exact match of the query
    where("name like ?", "%#{query}%")
  end

end
