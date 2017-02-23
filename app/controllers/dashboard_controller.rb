class DashboardController < BaseController
  def index
    @q = Act.ransack(params[:q])
    @acts = @q.result(distinct: true).includes(:act_types, :act_targets, :act_organizations).order(id: :asc).extended_search(params[:extended_search])
  end
end
