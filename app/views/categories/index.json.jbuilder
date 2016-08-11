json.array!(@category) do |category|
  json.extract! category, :nombre, :descripcion
  json.url category_url(category, format: :json)
end
