json.array!(@tamano) do |tamano|
  json.extract! tamano, :nombre, :descripcion
  json.url tamano_url(tamano, format: :json)
end
