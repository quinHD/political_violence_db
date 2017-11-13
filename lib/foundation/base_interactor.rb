# frozen_string_literal: true
module Foundation
  class BaseInteractor
    include ActiveSupport::Callbacks
    define_callbacks :call

    attr_accessor :request, :callee, :presenter_class, :success, :response_params, :errors

    def initialize(callee)
      @callee = callee
      @request = callee.request
      @response_params = HashWithIndifferentAccess.new
      @errors = []
      @success = false
      @presenter_class = self.class.global_presenter_class || EmptyPresenter
    end

    class << self
      attr_accessor :global_presenter_class

      def use_presenter_class(presenter_class)
        @global_presenter_class = presenter_class
      end
    end

    def call
      run_callbacks :call do
        do_call
      end
      success?
    end

    def build_presenter(options = {})
      presenter_class.new(response_params, callee.view_context, options, errors)
    end

    def params
      @_params ||= request.parameters
    end

    def success?
      success
    end

    class EmptyPresenter
    end
  end
end
