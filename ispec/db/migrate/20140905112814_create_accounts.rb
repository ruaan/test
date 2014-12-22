class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :name
      t.string :fullName
      t.integer :phone
      t.string :email

      t.timestamps
    end
  end
end
