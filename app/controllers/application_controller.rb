class ApplicationController < ActionController::API
  before_action :authenticate_key

  def authenticate_key
    if current_api_key.nil?
      render(json: { 'error' => 'Chave de API inválida' }, status: :unauthorized) && return
    end
  end

  private

  def sent_api_key
    request.headers['X-Api-Key']
  end

  def current_api_key
    ApiKey.find_by(key: sent_api_key)
  end
end
