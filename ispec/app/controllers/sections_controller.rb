class SectionsController < ApplicationController
  respond_to :html, :js
  before_action :set_section, only: [:show, :edit, :update, :destroy]

  # GET /sections
  # GET /sections.json
  def index
    @project = Project.all
    @sections = Section.all
  end

  # GET /sections/1
  # GET /sections/1.json
  def show
  end

  # GET /sections/new
  def new
    @project = Project.all
    @section = Section.new
  end

  # GET /sections/1/edit
  def edit
  end

  # POST /sections
  # POST /sections.json
  def create
    session[:return_to] ||= request.referer
    @project = Project.all
    #@projects = Project.find(params[:id])
    @section = Section.new(section_params)

    respond_to do |format|
      if @section.save
        format.html { redirect_to session.delete(:return_to), notice: 'Section was successfully created.' }
        format.json { render action: 'show', status: :created, location: @project }
      else
        format.html { render action: 'new' }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sections/1
  # PATCH/PUT /sections/1.json
  def update
    session[:return_to] ||= request.referer
    @project = Project.all
    respond_to do |format|
      if @section.update(section_params)
        format.html { redirect_to session.delete(:return_to), notice: 'Section was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sections/1
  # DELETE /sections/1.json
  def destroy
    session[:return_to] ||= request.referer
    @section.destroy
    respond_to do |format|
      format.html { redirect_to session.delete(:return_to) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_section
      @section = Section.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def section_params
      params.require(:section).permit(:project_id, :name, :description, :misc)
    end
end
