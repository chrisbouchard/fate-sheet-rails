# frozen_string_literal: true

class CreateCharacters < ActiveRecord::Migration[6.1]
  def change
    create_table :characters do |t|
      t.text :name, null: false
      t.integer :fate_points, null: false, default: 0
      t.integer :refresh, null: false

      t.timestamps
    end
  end
end
