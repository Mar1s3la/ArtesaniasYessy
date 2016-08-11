json.array!(@clientes) do |cliente|
  json.extract! cliente, :id, :nombre_cliente, :ap_paterno, :ap_materno, :calle, :numero, :colonia, :municipio, :estado, :pais, :telefono, :celular, :email
  json.url cliente_url(cliente, format: :json)
end
