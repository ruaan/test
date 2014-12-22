class WelcomeController < ApplicationController
  before_filter :authenticate_user!
  def index
    @account = Account.new
    @project = Project.new
    end

end
