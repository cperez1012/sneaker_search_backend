class SneakerSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :description, :image_url, :category_id, :category
end
