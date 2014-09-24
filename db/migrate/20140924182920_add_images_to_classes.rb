class AddImagesToClasses < ActiveRecord::Migration
  def change
    add_column :classes, :image, :string
  end
end
