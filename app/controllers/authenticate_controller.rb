class AuthenticateController < ApplicationController
  skip_before_action :authenticate_key
  before_action :find_or_create_api_key, only: %i[create]

  def create
    @api_key
  end

  private

  def find_or_create_api_key
    @api_key = ApiKey.find_or_create_by(remote_ip: request.remote_ip)
  end
end