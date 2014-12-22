class CreateFavourites < ActiveRecord::Migration
  def change
    create_table :favourites do |t|
      t.integer :user_id
      t.string :name
      t.string :section
      t.string :subsection
      t.integer :product_ids

      t.timestamps
    end
  end
end
