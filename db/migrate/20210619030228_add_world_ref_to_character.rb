class AddWorldRefToCharacter < ActiveRecord::Migration[6.1]
  def change
    add_reference :characters, :world, foreign_key: true
  end
end
