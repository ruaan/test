class ProjectsController < ApplicationController

 # prawnto :prawn => { :top_margin => 75 }
  before_action :set_project, only: [:show, :edit, :update, :destroy, :noprice]


  # GET /projects
  # GET /projects.json
  def index
    if params[:query].present?
      @projects = Project.search(params[:query], load: true)
    else
      @projects = Project.where(:user_id => current_user.id)
    end

  end

  # GET /projects/1 # GET /projects/1.json 
  def show 
    @users = User.where(:id => current_user.id) 
    @section = Section.new 
    @global = Global.new 
    @globals = Global.all 
    @subsections = Subsection.all 
    @subsection = Subsection.new 
    @copysubs = Copysub.all 
    @copysub = Copysub.new 
    @copysecs = Copysub.all 
    @copysec = Copysub.new 
    @account = Account.new 
    @accounts = Account.where(:user_id => current_user.id)
    @found = Project.find(params[:id])
    @blue = @found.id
    @lookup =  Section.where(project_id: @blue)
    @sections = Section.where(project_id: @blue)
    if @lookup.ids.blank?

      section = Section.new(:project_id => @blue)
      section.save

      @sectionLookup = @lookup.ids[0]

      subsection = Subsection.new(:section_id => @sectionLookup)
      subsection.save

    elsif @lookup.present?


    else
      # section = Section.new(:project_id => @blue)
      section = Section.new(:project_id => @blue)
      section.save
      @sectionLookup = @lookup.ids[0]

      subsection = Subsection.new(:section_id => @sectionLookup)
      subsection.save


    end

    #@section = Section.new
    # @blue = Project.find(params[:id])
    # @found = Project.find_all_by_id(params['project'])
    # test = Project.find(params[:id])
    # @blue = test[1]

    @pro = Project.all
    @projects = Project.find(params[:id])
    @products = Product.all
    @product = Product.new


    # getid = @project

  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit

  def edit
  end

  # POST /projects
  # POST /projects.json

  def create
    @section = Section.new
    @sections = Section.all
    @subsections = Subsection.all
    @subsection = Subsection.new

    @project = Project.new(project_params)
    respond_to do |format|
      if @project.save
        format.html { redirect_to welcome_index_path}
        format.json { head :no_content }
      else
        format.html { render action: 'new' }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    session[:line1] = "Add to Customer"
    session[:line2] = 'Add current Project to a Customer by clicking the flashing projects button on the left hand menu.'
    session[:line3] = 'Followed by the green button at the top. This will always assign the current project to a new customer.'
    session[:blink] = '.account'
    session[:return_to] ||= request.referer
    @user = User.all
    # @project = Project.update(params[:id])
    #   post = Post.find(1)
    #   post.title       # => "The current global position of migrating ducks"
    #   post.author.name # => "alloy"

    #   post.title = "On the migration of ducks"
    #   post.author.name = "Eloy Duran"

    #  post.save
    #  post.reload
    #   post.title       # => "On the migration of ducks"
    #  post.author.name
    #project = Project.where(flag: 0).ids
    change = set_project
    #getid = project
    change.flag = 1


    respond_to do |format|
      if @project.update(project_params)
        # project = Project.create(flag: 1)
        format.html { redirect_to session.delete(:return_to), notice: 'Project was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url }
      format.json { head :no_content }
    end
  end

  # PDF Generation starts here

  def pdf
    @section = Section.new
    pro = Project.find(params[:id])

    now = Project.where(id: pro)
    @sections = Section.all
    @subsections = Subsection.all
    @subsection = Subsection.new
    @project = Project.new
    @projects = Project.all
    @products = Product.all
    @product = Product.new
    accounts = Account.where(:user_id => current_user.id)
    respond_to do |format|
      format.html
      format.pdf do
        pdf = ConPdf.new(accounts,now)
        send_data pdf.render, filename: "order_12345",
                  type: "application/pdf",
                  disposition: "inline"

      end
    end
  end

  def pdfnoprice
    @section = Section.new
    pro = Project.find(params[:id])

    now = Project.where(id: pro)
    @sections = Section.all
    @subsections = Subsection.all
    @subsection = Subsection.new
    @project = Project.new
    @projects = Project.all
    @products = Product.all
    @product = Product.new
    accounts = Account.where(:user_id => current_user.id)
    respond_to do |format|
      format.html
      format.pdf do
        pdf = ConNoPricePdf.new(accounts,now)
        send_data pdf.render, filename: "order_12345",
                  type: "application/pdf",
                  disposition: "inline"

      end
    end
  end

  def noprice
    @section = Section.new
    pro = Project.find(params[:id])

    now = Project.where(id: pro)
    @sections = Section.all
    @subsections = Subsection.all
    @subsection = Subsection.new
    @project = Project.new
    @projects = Project.all
    @products = Product.all
    @product = Product.new
    accounts = Account.where(:user_id => current_user.id)
    respond_to do |format|
      format.html
      format.pdf do
        pdf = OrderPdf.new(accounts,now)
        send_data pdf.render, filename: "order_12345",
                  type: "application/pdf",
                  disposition: "inline"

      end
    end
  end

  def tech
    @section = Section.new
    pro = Project.find(params[:id])

    now = Project.where(id: pro)
    @sections = Section.all
    @subsections = Subsection.all
    @subsection = Subsection.new
    @project = Project.new
    @projects = Project.all
    @products = Product.all
    @product = Product.new
    accounts = Account.where(:user_id => current_user.id)
    respond_to do |format|
      format.html
      format.pdf do
        pdf = TechPdf.new(accounts,now)
        send_data pdf.render, filename: "order_12345",
                  type: "application/pdf",
                  disposition: "inline"

      end
    end
  end

  def technoprice
    @section = Section.new
    pro = Project.find(params[:id])

    now = Project.where(id: pro)
    @sections = Section.all
    @subsections = Subsection.all
    @subsection = Subsection.new
    @project = Project.new
    @projects = Project.all
    @products = Product.all
    @product = Product.new
    accounts = Account.where(:user_id => current_user.id)
    respond_to do |format|
      format.html
      format.pdf do
        pdf = TechNoPricePdf.new(accounts,now)
        send_data pdf.render, filename: "order_12345",
                  type: "application/pdf",
                  disposition: "inline"

      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_project
    @project = Project.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:id, :account_id, :projectName, :sapCode, :version, :documentType, :market, :randDollar, :randPound, :address, :contactPerson, :contactNumber, :notes, :flag, :steps, :user_id)
    end
end
