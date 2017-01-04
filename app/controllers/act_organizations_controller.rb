class ActOrganizationsController < BaseController
  def update_organizations
    @act_organization = ActOrganization.find_by(id: params[:id])
    @html_id = params[:html_id]
    respond_to :js
  end
end
