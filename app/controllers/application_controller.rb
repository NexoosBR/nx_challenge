class ApplicationController < ActionController::API
  
  def not_found
    render body: nil, :status => 404
  end

  def houston(e)
    Rails.logger.info e
		render body: e.to_s, status: 500
  end
end
