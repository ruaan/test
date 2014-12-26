class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit,:manage, :update, :destroy, :clone]
  def clone
    @testinput = "hello"
    @prescription = Prescription.find(params[:id])
    @new_prescription = @prescription.dup
    @new_prescription.save
  end
  # GET /products
  # GET /products.json
  def index
    @testinput = "hello"
    if params[:search]
      @products = Product.search(params[:search]).order("created_at DESC")
    else

      @products = Product.all.order('created_at DESC')
    end
    #@products = Product.all
    respond_to do |format|
      format.html
      format.csv { send_data @products.to_csv }
      format.xls { send_data @products.to_csv(col_sep: "\t") }
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @found = Product.find(params[:id])
    @found2 = Categorization.where(product_id: 5)
    @testinput = "hello"
     #@me = @found2.quantitys
  end

  # GET /products/new
  def new
    @testinput = "hello"
    @product = Product.new

  end

  # GET /products/1/edit
  def edit
  end

  def manage
    @testinput = "hello"
  end

  # POST /products
  # POST /products.json
  def create
    
    @product = Product.new(product_params)
    @product.subsection_ids = params[:product][:subsection_ids]
    save_route_back(@product)
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    @installs = Install.all
    @install = Install.new
    session[:line1] = "Save Quote"
    session[:line2] = 'Save current quote by clicking the flashing quote button on the left hand menu.'
    session[:line3] = 'Followed by the green button at the top. This will allow you to add quote info.'
    session[:blink] = '.project'
    session[:return_to] ||= request.referer
   # @projects = Project.find(params[:id])
   # @testinput = Project.find(params[:id])
   @product.subsection_ids = params[:product][:subsection_ids]
    #@install.install_ids = params[:install][:install_ids]
    #useids = @product.subsection_ids
    lineitem = Lineitem.new(params[:lineitem])
#    @subsection.lineitems << lineitem
    lineitem.save
    lineitem.subsection_ids = params[:product][:subsection_ids]
    lineitem.image =  @product.image
    lineitem.title = @product.title
    lineitem.sku = @product.sku
    lineitem.catagory = @product.catagory
    lineitem.quantity = 1
    lineitem.price = @product.price
    lineitem.description = @product.description
    lineitem.subdescription = @product.subdescription
    lineitem.vatex = false
    lineitem.inclvat = @product.price
    lineitem.save
   # TODO remove javascript option and replace with controller funtion
  #  @product.quantitys = params[:product][:subsection_ids]
  #  if test.lenght < 2
  #    punt
  #    end
  edit_route_back(@product)
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    session[:return_to] ||= request.referer
    @product.destroy
    respond_to do |format|
      format.html { redirect_to session.delete(:return_to) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:image, :title, :sku, :catagory, :price, :description, :subdescription )
    end
end
