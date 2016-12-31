json.array!(@pictures) do |picture|
  json.extract! picture, :id, :name, :house_id, :position
  json.url picture_url(picture, format: :json)
end
