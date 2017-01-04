class Admin::OrganizationsController < Admin::BaseController
  def index
    @organizations = ActOrganization.organizations
  end
end