json.array!(@topics) do |topic|
  json.extract! topic, :id, :category_id, :name
  json.url topic_url(topic, format: :json)
end
