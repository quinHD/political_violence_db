class Acts::ShowInteractor < Foundation::BaseInteractor
  use_presenter_class Acts::ShowPresenter

  def do_call
    response_params[:act] = act
  end

  def act
    Act.find(callee.params[:id])
  end
end
