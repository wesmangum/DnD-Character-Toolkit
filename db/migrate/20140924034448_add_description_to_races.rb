class AddDescriptionToRaces < ActiveRecord::Migration
  def change
    add_column :races, :description, :text
  end
end
