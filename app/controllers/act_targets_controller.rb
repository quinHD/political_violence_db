class ActTargetsController < BaseController
  def update_targets
    @act_target = ActTarget.find_by(id: params[:id])
    @html_id = params[:html_id]
    respond_to :js
  end
end
