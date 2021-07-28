# frozen_string_literal: true

class CreateStressTracks < ActiveRecord::Migration[6.1]
  def change
    create_table :stress_tracks do |t|
      t.integer :position, null: false
      t.string :name, null: false

      t.references :character, null: false, foreign_key: true

      t.timestamps

      t.index %i[character_id position], unique: true
    end
  end
end
