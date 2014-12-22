class LineitemsController < InheritedResources::Base

    before_action :set_lineitem, only: [:show, :edit,:manage, :update, :destroy, :clone]
    def clone

      @prescription = Prescription.find(params[:id])
      @new_prescription = @prescription.dup
      @new_prescription.save
    end
    # GET /lineitems
    # GET /lineitems.json
    def index

      if params[:search]
        @lineitems = Lineitem.search(params[:search]).order("created_at DESC")
      else

        @lineitems = Lineitem.all.order('created_at DESC')
      end
      #@lineitems = Lineitem.all
      respond_to do |format|
        format.html
        format.csv { send_data @lineitems.to_csv }
        format.xls { send_data @lineitems.to_csv(col_sep: "\t") }
      end
    end

    # GET /lineitems/1
    # GET /lineitems/1.json
    def show
      @found = Lineitem.find(params[:id])
      @found2 = Categorization.where(lineitem_id: 5)

      #@me = @found2.quantitys
    end

    # GET /lineitems/new
    def new

      @lineitem = Lineitem.new

    end

    # GET /lineitems/1/edit
    def edit
    end

    def manage

    end

    # POST /lineitems
    # POST /lineitems.json
    def create
      session[:return_to] ||= request.referer
      @lineitem = Lineitem.new(lineitem_params)
      @lineitem.subsection_ids = params[:lineitem][:subsection_ids]
      respond_to do |format|
        if @lineitem.save
          format.html { redirect_to session.delete(:return_to), notice: 'Lineitem was successfullyz created.' }
          format.json { render action: 'show', status: :created, location: @lineitem }
        else
          format.html { render action: 'new' }
          format.json { render json: @lineitem.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /lineitems/1
    # PATCH/PUT /lineitems/1.json
    def update
      session[:line1] = "Save Quote"
      session[:line2] = 'Save current quote by clicking the flashing quote button on the left hand menu.'
      session[:line3] = 'Followed by the green button at the top. This will allow you to add quote info.'
      session[:blink] = '.project'
      session[:return_to] ||= request.referer
      # @projects = Project.find(params[:id])
      # @testinput = Project.find(params[:id])
      @lineitem.subsection_ids = params[:lineitem][:subsection_ids]


      # TODO remove javascript option and replace with controller funtion
      #  @lineitem.quantitys = params[:lineitem][:subsection_ids]
      #  if test.lenght < 2
      #    punt
      #    end
      respond_to do |format|
        if @lineitem.update(lineitem_params)

          format.html { redirect_to session.delete(:return_to), notice: 'Lineitem was successfullyz updated.' }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @lineitem.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /lineitems/1
    # DELETE /lineitems/1.json
    def destroy
      session[:return_to] ||= request.referer
      @lineitem.destroy
      respond_to do |format|
        format.html { redirect_to session.delete(:return_to) }
        format.json { head :no_content }
      end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_lineitem
      @lineitem = Lineitem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lineitem_params
      params.require(:lineitem).permit(:image, :title, :sku, :catagory, :price, :description, :subdescription, :quantity,:vatex, :inclvat)
    end
  end
