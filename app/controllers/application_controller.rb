class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordInvalid, with: :render_validation_errors
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found


  private 

  def render_validation_errors(e)
    render json: { errors: e.record.errors }, status: :unprocessable_entity
  end
  
  def render_not_found(e)
    render json: { errors: e.message }, status: :not_found
  end
end
