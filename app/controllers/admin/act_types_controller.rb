class Admin::ActTypesController < Admin::BaseController
  def index
    @act_types = ActType.order(name: :asc)
  end
end
