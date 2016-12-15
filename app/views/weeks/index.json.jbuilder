json.array!(@weeks) do |week|
  json.extract! week, :id, :from, :to, :month_id
  json.url week_url(week, format: :json)
end
