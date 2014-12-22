class WelcomeController < ApplicationController
  before_filter :authenticate_user!
  def index
    @account = Account.new
   # @accounts = Account.where(:user_id => current_user.id)
    @project = Project.new
    @projects = Project.all
    if params[:search]
      @accounts = Account.search(params[:search]).order("created_at DESC").where(:user_id => current_user.id)
    else

      @accounts = Account.all.order('created_at DESC').where(:user_id => current_user.id)
    end
    end
end
