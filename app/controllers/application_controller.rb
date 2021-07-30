class ApplicationController < ActionController::API
  include JsonResponse
  include Exceptions
  before_action :use_json
end
