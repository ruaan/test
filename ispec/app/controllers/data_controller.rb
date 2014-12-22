require 'generator'
class DataController < ApplicationController
  before_filter :authenticate_user!
  prawnto :prawn => { :top_margin => 75 }

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
     projects.account_id = 1
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
    @projects = Project.all
    @products = Product.all
    @product = Product.new
    @accounts = Account.where(:user_id => current_user.id)
    respond_to do |format|
      format.html
      format.pdf do
        pdf = QuotePdf.new()
        send_data pdf.render, filename: "order_#322323.pdf",
                  type: "application/pdf",
                  disposition: "inline"
      end
    end

  end

  def one
    @projects = Project.all
    @subsections = Subsection.all
    @sections = Section.all
    session[:line1] = "Welcome to iSpec"
    session[:line2] = 'Start by adding Section and Subsections on the right.'
    session[:line3] = 'Start a quick quote by clicking the flashing products button on the left hand menu.'
    session[:blink] = '.product'
            if @projects.ids.blank?
      project = Project.create(flag: 0)
      number = 299999999 + rand(100) + rand(100)
      project.projectName = number
      project.save

      project = Project.create(projectName: number)
      project.save


      project.account_id = @account.id
      project.user_id = current_user.id
      project.save
      getid = project.id
      #section.project_id = '18'
      redirect_to project_path(id = getid)

     # getid = project.where(:user_id => current_user.id)

    elsif @projects.where(:flag => 0).where(:user_id => current_user.id).present?
     # project = Project.where(flag: 0)..where()

      @projectzs = Project.where(:flag => 0).where(:user_id => current_user.id).ids

      getid = @projectzs

    #section.project_id = '18'
      redirect_to project_path(id = getid)
     #@project = Project.new
    else
      @project = Project.create(flag: 0)
      number = 299999999 + rand(100) + rand(100)
      @project.projectName = number
      @project.save

      #number = 2 + rand(6) + rand(6)
      #randomnumber= number


      #@project.account_id = @account.id
      @project.user_id = current_user.id
      @project.save
      @projects.where(:flag => 0).where(:user_id => current_user.id).ids
      @getid = @project
      
     
    #  section.project_id = getid
   #   section.save
     # section.project_id = '18'

       
      redirect_to project_path(id = @getid)
    end

    @product = Product.new
    @accounts = Account.where(:user_id => current_user.id)
  end

  def noprice
    @section = Section.new

    @sections = Section.all
    @subsections = Subsection.all
    @subsection = Subsection.new
    @project = Project.new
    @projects = Project.all
    @products = Product.all
    @product = Product.new
    @accounts = Account.where(:user_id => current_user.id)
    respond_to do |format|
      format.html
      format.pdf do
        pdf = OrderPdf.new
        send_data pdf.render, filename: "order_12345",
                  type: "application/pdf",
                  disposition: "inline"

      end
    end
  end
  def pdf

    @section = Section.new

    @sections = Section.all
    @subsections = Subsection.all
    @subsection = Subsection.new
    @project = Project.new
    @projects = Project.all
    @products = Product.all
    @product = Product.new
    @accounts = Account.where(:user_id => current_user.id)
    respond_to do |format|
      format.html
      format.pdf do
        pdf = ConPdf.new
        send_data pdf.render, filename: "order_12345_con",
                  type: "application/pdf",
                  disposition: "inline"

      end
    end

  end

  def pdfnoprice

    @section = Section.new

    @sections = Section.all
    @subsections = Subsection.all
    @subsection = Subsection.new
    @project = Project.new
    @projects = Project.all
    @products = Product.all
    @product = Product.new
    @accounts = Account.where(:user_id => current_user.id)
    respond_to do |format|
      format.html
      format.pdf do
        pdf = ConNoPricePdf.new
        send_data pdf.render, filename: "order_12345_connoprice",
                  type: "application/pdf",
                  disposition: "inline"

      end
    end

  end

  def tech
    @section = Section.new

    @sections = Section.all
    @subsections = Subsection.all
    @subsection = Subsection.new
    @project = Project.new
    @projects = Project.all
    @products = Product.all
    @product = Product.new
    @accounts = Account.where(:user_id => current_user.id)
    respond_to do |format|
      format.html
      format.pdf do
        pdf = TechPdf.new
        send_data pdf.render, filename: "order_12345_tech",
                  type: "application/pdf",
                  disposition: "inline"
      end
    end

  end

  def technoprice
    @section = Section.new
    @sections = Section.all
    @subsections = Subsection.all
    @subsection = Subsection.new
    @project = Project.new
    @projects = Project.all
    @products = Product.all
    @product = Product.new
    @accounts = Account.where(:user_id => current_user.id)
    respond_to do |format|
      format.html
      format.pdf do
        pdf = TechNoPricePdf.new
        send_data pdf.render, filename: "order_12345_technoprice",
                  type: "application/pdf",
                  disposition: "inline"

      end
    end

  end
  
  def showfav
    @globals = Global.all
  end
  def addfav
    @projects = Project.all
     @project = Project.new
     #session[:return_to] ||= "project/28"
    @favname = params[:favname]
    @projectid = params[:projectid]
    @getdatas = Global.where(name: @favname)
    @getdatas.each do |l|
    if l.section == @testsection
    else
      @testsection = l.section
    @section = Section.new
    @section.project_id = @projectid
    @section.name = l.section
    @section.save
    #@testsection = ""
    end
    if l.subsection == @testsubsection
    else
      @testsubsection = l.subsection
    @subsection = Subsection.new
    @subsection.section_id = @section.id
    @subsection.name = l.subsection
    @subsection.save
    #@testsubsection = ""
    #@lineitem = @subsection.lineitems.create(title: l.title)
    end
    @lineitem = @subsection.lineitems.create(image:l.image, title: l.title, sku:l.sku, catagory: l.catagory, price: l.price, description: l.description, quantity: l.quantity,  inclvat: l.price)
  
  end

redirect_to project_path(id = @projectid)
end

end
