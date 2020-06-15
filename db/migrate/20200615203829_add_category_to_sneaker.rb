class AddCategoryToSneaker < ActiveRecord::Migration[6.0]
  def change
    add_reference :sneakers, :category, foreign_key: true
  end
end
