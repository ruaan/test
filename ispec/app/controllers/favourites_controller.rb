class FavouritesController < InheritedResources::Base
    before_action :set_favourite, only: [:show, :edit, :update, :destroy]

    # GET /subsections
    # GET /subsections.json
    def index
      @favourites = Favourite.all
    end

    # GET /subsections/1
    # GET /subsections/1.json
    def show

    end

    # GET /subsections/new
    def new
      @favourite = Favourite.new
    end

    # GET /subsections/1/edit
    def edit
    end

    # POST /subsections
    # POST /subsections.json
    def create
      session[:return_to] ||= request.referer
      @favourites = Favourite.new(favourite_params)


      respond_to do |format|
        if @favourites.save
          format.html { redirect_to session.delete(:return_to), notice: 'Favourite was successfully created.' }
          format.json { render action: 'show', status: :created, location: data_show_path }
        else
          format.html { render action: 'new' }
          format.json { render json: @favourite.errors, status: :unprocessable_entity }
        end
      end
    end


    # PATCH/PUT /subsections/1
    # PATCH/PUT /subsections/1.json
    def update

      respond_to do |format|
        if @favourite.update(favourite_params)
          format.html { redirect_to @favourite, notice: 'Favourite was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @favourite.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /subsections/1
    # DELETE /subsections/1.json
    def destroy
      @favourite.destroy
      respond_to do |format|
        format.html { redirect_to @favourite }
        format.json { head :no_content }
      end
    end

    private
    def set_favourite
      @favourite = Favourite.find(params[:id])
    end

    def favourite_params
      params.require(:favourite).permit(:user_id, :name, :section, :subsection, :product_ids)
    end
end


