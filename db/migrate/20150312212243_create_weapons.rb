class CreateWeapons < ActiveRecord::Migration
  def change
    create_table :weapons do |t|
      t.integer :zombie_id
      t.string :name
      t.integer :damage

      t.timestamps null: false
    end
  end
end
