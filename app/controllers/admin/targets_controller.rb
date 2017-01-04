class Admin::TargetsController < Admin::BaseController
  def index
    @targets = ActTarget.targets
    @target = ActTarget.new
  end

  def create
    parent = ActTarget.find_by_id(target_params[:parent])
    if parent.present?
      @target = ActTarget.new(name: target_params[:name], description: target_params[:description], label: parent.child_label)
      @target.parent = parent
    else
      @target = ActTarget.new(name: target_params[:name], description: target_params[:description], label: ActTarget::TARGET)
    end
    if @target.valid?
      @target.save
      # flash.now[:notice] = "Objetivo creado"
      render "create.js.erb"
    else
      render :error
    end
  end

  def destroy
    target = ActTarget.find(params[:id])
    if target.destroy
      redirect_to admin_targets_path
      flash[:notice] = "Objetivo eliminado con éxito"
    end
  end

  private

  def target_params
    params.require(:act_target).permit(:name, :description, :parent)
  end
end