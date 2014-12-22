class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :customer
      t.string :name
      t.string :version
      t.string :description
      t.string :documentType
      t.string :market
      t.date :startDate
      t.date :followUp
      t.string :pricelist
      t.string :projectStage
      t.string :T

      t.timestamps
    end
  end
end
