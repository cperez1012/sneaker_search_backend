class CreateSneakers < ActiveRecord::Migration[6.0]
  def change
    create_table :sneakers do |t|
      t.string :name
      t.string :description
      t.string :image_url
      t.integer :category_id
      t.integer :quantity
      t.decimal :shoe_size, precision:15, scale:1

      t.timestamps
    end
  end
end
