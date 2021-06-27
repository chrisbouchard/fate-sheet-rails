# frozen_string_literal: true

class AddAuth0IdToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :auth0_id, :text
    add_index :users, :auth0_id, unique: true
  end
end
