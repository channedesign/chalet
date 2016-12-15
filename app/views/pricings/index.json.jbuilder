json.array!(@pricings) do |pricing|
  json.extract! pricing, :id, :price, :week_id
  json.url pricing_url(pricing, format: :json)
end
