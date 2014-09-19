class AddDescriptionToCharacters < ActiveRecord::Migration
  def change
    add_column :characters, :name, :string
    add_column :characters, :sex, :string
    add_column :characters, :height, :integer
    add_column :characters, :weight, :integer
    add_column :characters, :alignment, :string
    add_column :characters, :background, :string
    add_column :characters, :personality, :string
    add_column :characters, :appearance, :string
  end
end
