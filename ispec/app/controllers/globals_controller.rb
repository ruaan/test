class GlobalsController < InheritedResources::Base
  before_action :set_global, only: [:show, :edit, :update, :destroy]

   # GET /globals
   # GET /globals.json
   def index
     @globals = Global.all

   end

   # GET /globals/1
   # GET /globals/1.json
   def show
     section = params[:section_id]
   end

   # GET /globals/new
   def new

     @global = Global.new

   end

   # GET /globals/1/edit
   def edit

   end



   # POST /globals
   # POST /globals.json
   def create
     session[:return_to] ||= request.referer


     @sectionx = global_params[:section_id]

     p = Section.where(id: @sectionx).first
     t = Subsection.where(section_id: @sectionx).first

     zf = t.lineitems
     #ssub = @findsection.subsections

     zf.each do |f|
       @global = Global.new
       @global.name = global_params[:name]
       @global.section = p.name
       @global.subsection =  t.name
       @global.image = f.image
       @global.title = f.title
       @global.description = f.description
       @global.subdecription = f.subdescription

       @global.price = f.price
       @global.save
    end

    # z = f.first



     respond_to do |format|
       if @global.save
         format.html { redirect_to session.delete(:return_to), notice: 'Favourite was successfully created.' }
         format.json { render action: 'show', status: :created, location: @global }
       else
         format.html { render action: 'new' }
         format.json { render json: @global.errors, status: :unprocessable_entity }
       end
     end

   end

   # PATCH/PUT /globals/1
   # PATCH/PUT /globals/1.json
   def update
      session[:return_to] ||= request.referer


     respond_to do |format|
       if @global.update(global_params)
         format.html { redirect_to session.delete(:return_to), notice: 'Global was successfully updated.' }
         format.json { head :no_content }
       else
         format.html { render action: 'edit' }
         format.json { render json: @global.errors, status: :unprocessable_entity }
       end
     end

   end

   # DELETE /globals/1
   # DELETE /globals/1.json
   def destroy
     session[:return_to] ||= request.referer
     @global.destroy
     respond_to do |format|
       format.html { redirect_to redirect_to session.delete(:return_to) }
       format.json { head :no_content }
     end
   end

   private
     # Use callbacks to share common setup or constraints between actions.
     def set_global
       @global = Global.find(params[:id])
     end
    def global_params
      params.require(:global).permit(:section_id, :name, :section, :subsection, :image, :title, :sku, :quantity, :name, :description, :subdecription, :price)
    end
end

