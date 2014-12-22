class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.integer :project_id
      t.integer :section_id
      t.integer :subsection_id
      t.integer :fav_id
      t.boolean :fav
      t.string :image
      t.string :title
      t.string :sku
      t.string :category
      t.string :manufacturer
      t.string :price
      t.integer :discount
      t.string :description
      t.string :subdescription

      t.timestamps
    end
  end
end
