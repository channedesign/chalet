json.array!(@months) do |month|
  json.extract! month, :id, :name, :appartment_id
  json.url month_url(month, format: :json)
end
