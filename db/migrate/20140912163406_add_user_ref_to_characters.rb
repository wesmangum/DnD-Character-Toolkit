class AddUserRefToCharacters < ActiveRecord::Migration
  def change
    add_reference :characters, :user, index: true
  end
end
