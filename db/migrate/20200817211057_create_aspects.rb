class CreateAspects < ActiveRecord::Migration[6.0]
  def change
    create_table :aspects do |t|
      t.integer :position, null: false
      t.text :name
      t.text :label

      t.references :aspected, null: false, polymorphic: true

      t.timestamps

      t.index [:aspected_id, :position], unique: true
    end
  end
end
