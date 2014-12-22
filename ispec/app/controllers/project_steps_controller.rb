class ProjectStepsController < ApplicationController
  include Wicked::Wizard
  steps :step2, :step3

  def show
    render_wizard
  end
end
