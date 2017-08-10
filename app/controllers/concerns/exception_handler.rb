module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    rescue_from StandardError do |error|
      respond({ message: error.message }, :standard_error)
    end

    rescue_from ActiveRecord::RecordNotFound do |error|
      respond({ message: error.message }, :not_found)
    end

    rescue_from ActiveRecord::RecordInvalid do |error|
      respond({ message: error.message }, :unprocessable_entity)
    end

  end

  private

  def respond(object, status)
    render json: object, status: status
  end
end
