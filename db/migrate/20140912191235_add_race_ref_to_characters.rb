class AddRaceRefToCharacters < ActiveRecord::Migration
  def change
    add_reference :characters, :race, index: true
  end
end
