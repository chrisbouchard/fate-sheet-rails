class CreateSkills < ActiveRecord::Migration[6.0]
  def change
    create_table :skills do |t|
      t.belongs_to :character, null: false, foreign_key: true

      t.text :name, null: false
      t.integer :level, null: false

      t.timestamps
    end
  end
end
