class Rack::Attack
  Rack::Attack.cache.store = ActiveSupport::Cache::MemoryStore.new
  
  # Always allow requests from localhost
  # (blocklist & throttles are skipped)
  safelist('allow from localhost') do |request|
    # Requests are allowed if the return value is truthy
    '127.0.0.1' == request.ip || '::1' == request.ip
  end

  # Throttle requests from an ip to 6 reqs/minute
  throttle("requests by ip", limit: 6, period: 60) do |request|
    request.ip
  end
end