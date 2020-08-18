class CreateAspects < ActiveRecord::Migration[6.0]
  def change
    create_table :aspects do |t|
      t.integer :position, null: false
      t.text :name
      t.text :label

      t.belongs_to :character, null: false, foreign_key: true

      t.timestamps

      t.index [:character_id, :position], unique: true
    end
  end
end
