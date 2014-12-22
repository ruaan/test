json.array!(@products) do |product|
  json.extract! product, :id, :subsection_id, :image, :title, :sku, :range, :description
  json.url product_url(product, format: :json)
end
