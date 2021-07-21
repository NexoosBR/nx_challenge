class ApplicationController < ActionController::API
  def render_error(message: nil, fields: nil, status: :unprocessable_entity)
    errors = {}
    errors['fields'] = fields if fields.present?
    errors['message'] = message if message.present?
    render json: { errors: errors }, status: status
  end
end
