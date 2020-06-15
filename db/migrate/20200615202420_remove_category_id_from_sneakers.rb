class RemoveCategoryIdFromSneakers < ActiveRecord::Migration[6.0]
  def change
    remove_column :sneakers, :category_id, :integer
  end
end
