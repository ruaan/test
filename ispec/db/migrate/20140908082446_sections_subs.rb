class SectionsSubs < ActiveRecord::Migration
  def up
    create_table :sections_subs, :id => false do |t|
      t.integer :section_id
      t.integer :sub_id
    end
  end

    def down
      change_table :sections_subs, :id => false do |t|
        t.integer :section_id
        t.integer :sub_id
      end
end

end