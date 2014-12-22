require 'generator'
class DataController < ApplicationController
  def dataform
  end

  def generate

    Project.destroy_all
    Account.destroy_all
    # email must be unique - watch for INFINITE LOOP

      accounts_max = 40 + rand(3)
      1.upto(accounts_max) do |number|
        accounts = Account.new
        name = Generator::get_first_name
        1.upto(6) do |number2|
          accounts.name = name
          accounts.fullName = Generator::get_first_name + " " + Generator::get_last_name
          accounts.phone = "+2783"+rand(9999).to_s+rand(9999).to_s
          accounts.email = Generator::get_first_name + Generator::get_email_server
          end
        accounts.save
      end

   projects_max = 40 + rand(3)

   1.upto(projects_max) do |number|
     projects = Project.new
     name = Generator::get_first_name
       projects.customer = name
       projects.name = Generator::get_first_name + " " + Generator::get_last_name
       projects.version = 1.0
       projects.description = Generator::get_description
       projects.documentType = Generator::get_book_category
       projects.market = "sfdsfdsf"
       t = Time.now
       projects.startDate = t
       projects.followUp = t.localtime("+09:00")
       projects.pricelist = "sdfsfd"
       projects.projectStage = "fsdsfdsfd"
       projects.save
   end


end

def delete
  #User.destroy_all
  Account.destroy_all
  Project.destroy_all
 # Offtimesdestroy_all
  #    User.where(:role_id => 3).destroy_all
end

  def list
    @products = Product.all
    @sections = Section.all
    @subsections = Subsection.all
    @products = Product.all
  end

  def misc
  end

  def show
    @section = Section.new

    @sections = Section.all
    @subsections = Subsection.all
    @subsection = Subsection.new
    @project = Project.new
    @products = Product.all
    @product = Product.new
  end
end
