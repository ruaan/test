class CopysubsController < InheritedResources::Base
  before_action :set_copysub, only: [:show, :edit, :update, :destroy]

    # GET /copysubs
    # GET /copysubs.json
    def index
      @copysubs = Copysub.all
    end

    # GET /copysubs/1
    # GET /copysubs/1.json
    def show
      @project = Project.all
    end

    # GET /copysubs/new
    def new
      @copysub = Copysub.new
      @projects = Project.all
       @project = Project.new
    
    end

    # GET /copysubs/1/edit
    def edit
       @projects = Project.all
            @project = Project.new
    end

    # POST /copysubs
    # POST /copysubs.json
    def create
    session[:return_to] ||= request.referer
       @copysub = Copysub.new(copysub_params)
      @subsectionx = copysub_params[:subsection_id]
      #@test = params[:other_param]
      @copyToSection = copysub_params[:section_id]
      @newname = copysub_params[:name]
   
   
       t = Subsection.where(id: @subsectionx).first
       fs = t.lineitems
       @subsection = Subsection.new
       @subsection.section_id = @copyToSection
       @subsection.name = @newname
       @subsection.save
       # z = f.first
       fs.each do |f|
         @lineitem = @subsection.lineitems.create(image:f.image, title: f.title, sku:f.sku, catagory: f.catagory, price: f.price, description: f.description, quantity: f.quantity,  inclvat: f.price)
       end
       #@copysub.save
      respond_to do |format|
        if @copysub.save
          format.html { redirect_to session.delete(:return_to), notice: 'Copysub was successfully created.' }
          format.json { render action: 'show', status: :created, location: data_show_path }
        else
          format.html { render action: 'new' }
          format.json { render json: @copysub.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /copysubs/1
    # DELETE /copysubs/1.json
    def destroy
      session[:return_to] ||= request.referer
      @copysub.destroy
      respond_to do |format|
        format.html { redirect_to session.delete(:return_to) }
        format.json { head :no_content }
      end
    end
  private

    def copysub_params
      params.require(:copysub).permit(:section_id, :subsection_id, :name, :description)
    end
end

