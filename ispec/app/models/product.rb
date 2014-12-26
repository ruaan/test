class Product < ActiveRecord::Base
  validates :subsection_ids, :presence => true
  after_update :copy_stuff
  mount_uploader :image, PictureUploader

  has_many :categorizations
  has_many :subsections, :through => :categorizations

  accepts_nested_attributes_for :categorizations

  has_many :installcategorizations
  has_many :installs, through: :installcategorizations

  accepts_nested_attributes_for :installcategorizations

  def self.search(query)
# where(:title, query) -> This would return an exact match of the query
    where("title like :q or price like :q or sku like :q ", q: "%#{query}%")
  end



  def copy_stuff
    #return unless self.new_record?
   # @projects = Project.find(params[:id])
   session[:line1] = "Save Quote"
   session[:line2] = 'Save current quote by clicking the flashing quote button on the left hand menu.'
   session[:line3] = 'Followed by the green button at the top. This will allow you to add quote info.'
   session[:blink] = '.project'

  end


  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |product|
        csv << product.attributes.values_at(*column_names)
      end
    end
  end
end
