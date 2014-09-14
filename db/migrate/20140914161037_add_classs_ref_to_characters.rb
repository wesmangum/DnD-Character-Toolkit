class AddClasssRefToCharacters < ActiveRecord::Migration
  def change
    add_column :characters, :classs_id, :integer
  end
end
