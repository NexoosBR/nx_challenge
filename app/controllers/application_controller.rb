class ApplicationController < ActionController::API
  def not_found
    render body: nil, :status => 404
  end
end
