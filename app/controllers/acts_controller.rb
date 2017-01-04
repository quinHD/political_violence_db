class ActsController < BaseController
  wrap_parameters Act

  def index
    @q = Act.ransack(params[:q])
    @acts = @q.result(distinct: true).includes(:act_types, :act_targets, :act_organizations).order(id: :asc).extended_search(params[:extended_search])
  end

  def show
    @act = Act.find(params[:id])
  end

  def new
    @act = Act.new
    @act.build_place
    @act.build_result
  end

  def create
    binding.pry
    @act = Act.new(act_parameters)
    if @act.save
      flash.notice = "Acción creada con éxito"
      redirect_to acts_path
    else
      @act.build_place
      @act.build_result
      flash.now[:alert] = "Errores en el formulario"  
      render :new
    end
  end

  def edit
    @act = Act.find(params[:id])
  end

  def update
    @act = Act.find(params[:id])
    if @act.update(act_parameters) && @act.create_modification(current_user)
      flash.notice = "Acción editada con éxito"
      redirect_to @act
    else
      @act.build_place
      @act.build_result 
      flash.now[:alert] = "Errores en el formulario" 
      render :new
    end
  end

  def destroy
    @act = Act.find(params[:id])
    @act.destroy
    flash.now[:notice] = "Acción eliminada"
    redirect_to acts_path
  end

  def filter
    @q = Act.ransack(params[:q])
    @acts = @q.result(distinct: true)
  end

  private

  def act_parameters
    params.require(:act).permit(
      :user_id,
      :name, :description, :start_date, :end_date, :number_participants , :note,
      place_attributes: [:id, :country, :province, :city, :name, :type_of_area, :description],
      act_organization_ids: [], 
      act_type_ids: [],
      act_target_ids: [],
      result_attributes: [:id, :arrested, :deaths, :economic_cost, :injured, :missing, :personal_attacks, :property_attacks],
    )
  end
end
