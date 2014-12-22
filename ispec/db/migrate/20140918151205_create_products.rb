class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :subsection_id
      t.string :image
      t.string :title
      t.string :sku
      t.string :range
      t.string :description

      t.timestamps
    end
  end
end
