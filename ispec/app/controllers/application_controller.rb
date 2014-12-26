class ApplicationController < ActionController::Base
  before_filter :authenticate_user!
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :configure_permitted_parameters, if: :devise_controller?
  protected

  def configure_permitted_parameters
    ## To permit attributes while registration i.e. sign up (app/views/devise/registrations/new.html.erb)
    devise_parameter_sanitizer.for(:sign_up) << :role << :training_mode

  end

  def save_route_back(input)
    session[:return_to] ||= request.referer
    respond_to do |format|
      if input.save
        format.html { redirect_to session.delete(:return_to), notice: ''input'was successfullyz created.' }
        format.json { render action: 'show', status: :created, location: input }
      else
        format.html { render action: 'new' }
        format.json { render json: input.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit_route_back(input)
    session[:return_to] ||= request.referer
    respond_to do |format|
      if input.update(input_params)

        format.html { redirect_to session.delete(:return_to), notice: ''input' was successfullyz updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: input.errors, status: :unprocessable_entity }
      end
    end

end
