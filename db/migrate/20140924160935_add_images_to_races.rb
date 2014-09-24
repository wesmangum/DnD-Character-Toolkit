class AddImagesToRaces < ActiveRecord::Migration
  def change
    add_column :races, :image, :string
  end
end
