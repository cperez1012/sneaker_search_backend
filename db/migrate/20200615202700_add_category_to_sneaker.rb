class AddCategoryToSneaker < ActiveRecord::Migration[6.0]
  def change
    add_reference :sneakers, :category, null: false, foreign_key: true
  end
end
