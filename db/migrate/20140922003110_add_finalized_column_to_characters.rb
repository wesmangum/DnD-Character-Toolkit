class AddFinalizedColumnToCharacters < ActiveRecord::Migration
  def change
    add_column :characters, :finalized?, :boolean, default: false
  end
end
