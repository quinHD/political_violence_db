class Admin::ActsController < Admin::BaseController
  def index
    @acts = Act.all.includes(:act_types, :creator, :act_organizations).order(id: :asc)
  end

  def show
    @act = Act.find(params[:id])
  end
end
