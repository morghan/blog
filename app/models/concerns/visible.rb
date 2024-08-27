module Visible
  # To add validations, which are done at class level(model) we must extend the module
  # with the ActiveSupport::Concern API
  extend ActiveSupport::Concern

  VALID_STATUSES = ['public', 'private', 'archived'] # rubocop:disable Style/WordArray
  # This validation will be done when the module is included in a model
  included do
    validates :status, inclusion: { in: VALID_STATUSES }
  end

  class_methods do
    def public_count
      where(status: 'public').count
    end
  end

  def archived?
    status == 'archived'
  end
end
