class AddDescriptionToDdClasses < ActiveRecord::Migration
  def change
    add_column :classes, :description, :text
  end
end
