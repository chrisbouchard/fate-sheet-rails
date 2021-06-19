class CreateWorlds < ActiveRecord::Migration[6.1]
  def change
    create_table :worlds do |t|
      t.string :name, null: false
      t.string :description

      t.timestamps
    end
  end
end
