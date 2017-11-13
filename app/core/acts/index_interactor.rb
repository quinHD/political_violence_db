class Acts::IndexInteractor < Foundation::BaseInteractor
  use_presenter_class Acts::IndexPresenter

  def do_call
    response_params[:q] = q
    response_params[:acts] = acts
  end

  def q
    Act.ransack(params[:q])
  end

  def acts
    q.result(distinct: true)
      .includes(:act_types, :act_targets, :act_organizations)
      .order(id: :asc)
      .extended_search(params[:extended_search])
  end
end
