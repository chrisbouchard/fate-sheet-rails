# frozen_string_literal: true

class CreateStressBoxes < ActiveRecord::Migration[6.1]
  def change
    create_table :stress_boxes do |t|
      t.integer :position, null: false
      t.integer :level, null: false
      t.boolean :checked, null: false, default: false

      t.references :stress_track, null: false, foreign_key: true

      t.timestamps

      t.index %i[stress_track_id position], unique: true
    end
  end
end
