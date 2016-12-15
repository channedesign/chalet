json.array!(@appartments) do |appartment|
  json.extract! appartment, :id, :name, :house_id
  json.url appartment_url(appartment, format: :json)
end
