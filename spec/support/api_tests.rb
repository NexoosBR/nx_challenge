module ApiTests
  def parsed_body
    JSON.parse(response.body, symbolize_names: true)
  end
end
