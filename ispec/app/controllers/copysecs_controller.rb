class CopysecsController < InheritedResources::Base
  before_action :set_copysec, only: [:show, :edit, :update, :destroy]

   # GET /copysecs
   # GET /copysecs.json
   def index
     @copysecs = Copysec.all
   end

   # GET /copysecs/1
   # GET /copysecs/1.json
   def show
     @project = Project.all
   end

   # GET /copysecs/new
   def new
     @copysec = Copysec.new
     @projects = Project.all
      @project = Project.new
   end

   # GET /copysecs/1/edit
   def edit
      @projects = Project.all
           @project = Project.new
   end

   # POST /copysecs
   # POST /copysecs.json
   def create
    session[:return_to] ||= request.referer
      @copysec = Copysec.new(copysec_params)
      @project = Project.all
      #= Copysec.find(params[:section_ids])
      @sectionx = copysec_params[:section_id]
      @newname = copysec_params[:name]
      @findsection = Section.where(id:@sectionx).first
      @section = Section.new
      @section.project_id = @findsection.project_id
      @section.name = @newname
      @section.description = @section.id
      @section.save
      @subsection = Subsection.where(section_id: @findsection.id).last
       ssub = @findsection.subsections
       zf = @subsection.lineitems
       ssub.each do |f|
           @subsection = @section.subsections.create(section_id: f.section_id, name: f.name)
           zf.each do |g|
             @lineitem = @subsection.lineitems.create(image:g.image, title: g.title, sku: g.sku, catagory: g.catagory, price: g.price, description: g.description, quantity: g.quantity, inclvat: g.price)

           end
      end
     
     # t = subsection.where(id:@sectionx).first
     # fs = t.lineitems
     # @subsection = Subsection.new
     # @subsection.section_id = @copyToSection
     # @subsection.name = @findsection.name
     # @subsection.save
     
     
     
      # z = f.first
      #fs.each do |f|
     #   @lineitem = @subsection.lineitems.create(image: f.image, title: f.title)
     # end

     respond_to do |format|
       if @copysec.save
         format.html { redirect_to session.delete(:return_to), notice: 'Copysec was successfully created.' }
         format.json { render action: 'show', status: :created, location: data_show_path }
       else
         format.html { render action: 'new' }
         format.json { render json: @copysec.errors, status: :unprocessable_entity }
       end
     end
   end

   # DELETE /copysecs/1
   # DELETE /copysecs/1.json
   def destroy
     session[:return_to] ||= request.referer
     @copysec.destroy
     respond_to do |format|
       format.html { redirect_to session.delete(:return_to) }
       format.json { head :no_content }
     end
   end
  private

    def copysec_params
      params.require(:copysec).permit(:project_id, :section_id, :name, :description)
    end
end

