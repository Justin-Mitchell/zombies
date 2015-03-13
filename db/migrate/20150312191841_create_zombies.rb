class CreateZombies < ActiveRecord::Migration
  def change
    create_table :zombies do |t|
      t.string :name
      t.string :graveyard
      t.string :status

      t.timestamps null: false
    end
    
    create_table :tweets do |t|
      t.string :status
      t.integer :zombie_id

      t.timestamps null: false
    end
    
    create_table :weapons do |t|
      t.integer :zombie_id
      t.string :name
      t.integer :damage

      t.timestamps null: false
    end
  end
end
