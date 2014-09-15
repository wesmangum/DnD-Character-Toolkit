class AddClasssRefToCharacters < ActiveRecord::Migration
  def change
    add_column :characters, :dd_class_id, :integer
  end
end
