json.array!(@clients) do |client|
  json.extract! client, :name, :surname, :email, :phone
  json.url client_url(client, format: :json)
end
