class SneakerSerializer
  include FastJsonapi::ObjectSerializer
  
  attributes :name, :description, :image_url, :quantity, :shoe_size, :category_id, :category
  set_key_transform :camel_lower
end
