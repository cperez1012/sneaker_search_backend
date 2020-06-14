class CreateNames < ActiveRecord::Migration[6.0]
  def change
    create_table :names do |t|
      t.string :description
      t.string :image_url
      t.integer :category_id

      t.timestamps
    end
  end
end
