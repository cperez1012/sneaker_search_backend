class SneakerSerializer
  include FastJsonapi::ObjectSerializer
  
  attributes :name, :description, :image_url, :category_id, :category
  set_key_transform :camel_lower
end
