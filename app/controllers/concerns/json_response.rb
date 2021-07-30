module JsonResponse
  protected

  def use_json
    request.format = :json
  end

  def json_response(obj, status=:ok)
  	render json: obj, status: status
  end
end
