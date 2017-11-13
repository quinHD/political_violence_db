class Acts::NewInteractor < Foundation::BaseInteractor
  use_presenter_class Acts::ShowPresenter

  def do_call
    response_params[:act] = act
  end

  def act
    @_act ||= begin
      empty_act = Act.new
      empty_act.tap do |a|
        a.build_place
        a.build_result
      end
    end
  end
end
