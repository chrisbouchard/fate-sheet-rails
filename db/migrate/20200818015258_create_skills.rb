class CreateSkills < ActiveRecord::Migration[6.0]
  def change
    create_table :skills do |t|
      t.integer :level, null: false
      t.text :name, null: false

      t.belongs_to :character, null: false, foreign_key: true

      t.timestamps

      t.index [:character_id, :name], unique: true
    end
  end
end
