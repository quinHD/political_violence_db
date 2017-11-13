# frozen_string_literal: true
module Foundation
  class BasePresenter < SimpleDelegator
    include ActionView::Helpers::NumberHelper

    attr_reader :errors, :context, :options

    def initialize(data_obj, context, options = {}, errors = nil)
      @context = context
      @options = options
      # TODO: Should it inspect the object and prepouplate the fields with "" (e.g. {name: ""})?
      @errors = errors || {}
      super(data_obj)
    end

    alias h context
    alias obj __getobj__

    def errors?
      errors.any?
    end

    def each_error
      errors.each do |_key, msg|
        # TODO: context with key?
        yield I18n.t(msg)
      end
    end
  end
end
