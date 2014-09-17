class AddColumnsToCharacters < ActiveRecord::Migration
  def change
    add_column :characters, :climb, :integer
    add_column :characters, :concentration, :integer
    add_column :characters, :heal, :integer
    add_column :characters, :intimidate, :integer
    add_column :characters, :move_silently, :integer
    add_column :characters, :spellcraft, :integer
  end
end
