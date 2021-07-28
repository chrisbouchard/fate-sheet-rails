# frozen_string_literal: true

class AddDescriptionPowerLevelSkillPointsToCharacter < ActiveRecord::Migration[6.1]
  def change
    add_column :characters, :description, :text
    add_column :characters, :power_level, :int
    add_column :characters, :skill_points, :int
  end
end
