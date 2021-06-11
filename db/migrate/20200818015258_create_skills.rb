# frozen_string_literal: true

class CreateSkills < ActiveRecord::Migration[6.1]
  def change
    create_table :skills do |t|
      t.integer :level, null: false
      t.text :name, null: false

      t.belongs_to :character, null: false, foreign_key: true

      t.timestamps

      t.index %i[character_id name], unique: true
    end
  end
end
