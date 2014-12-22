class VersionsController < InheritedResources::Base

  private

    def version_params
      params.require(:version).permit(:account_id, :project_id, :user_id, :version)
    end
end

