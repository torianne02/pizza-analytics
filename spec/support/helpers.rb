module Helpers
  def json
    JSON.parse(last_response.body)
  end

  def to_json(data)
    JSON[data.to_json]
  end 
end
