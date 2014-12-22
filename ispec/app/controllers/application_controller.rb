class ApplicationController < ActionController::Base
  before_filter :authenticate_user!
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :configure_permitted_parameters, if: :devise_controller?

      protected

  def configure_permitted_parameters
    ## To permit attributes while registration i.e. sign up (app/views/devise/registrations/new.html.erb)
    devise_parameter_sanitizer.for(:sign_up) << :role << :training_mode

    ## To permit attributes while editing a registration (app/views/devise/registrations/edit.html.erb)
    devise_parameter_sanitizer.for(:account_update) << :role << :training_mode
  end
end
