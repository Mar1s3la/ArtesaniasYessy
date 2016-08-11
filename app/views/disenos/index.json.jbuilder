json.array!(@diseno) do |diseno|
  json.extract! diseno, :nombre, :diseno
  json.url diseno_url(diseno, format: :json)
end
