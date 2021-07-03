# frozen_string_literal: true

class RemoveNameAndShortNameFromUser < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :name, :string
    remove_column :users, :short_name, :string
  end
end
