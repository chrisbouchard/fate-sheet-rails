class CreateAspects < ActiveRecord::Migration[6.0]
  def change
    create_table :aspects do |t|
      t.text :name, null: false
      t.text :label, null: false

      t.belongs_to :character, null: false, foreign_key: true

      t.timestamps
    end
  end
end
