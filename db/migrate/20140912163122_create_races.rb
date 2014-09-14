class CreateRaces < ActiveRecord::Migration
  def change
    create_table :races do |t|

      t.timestamps
      t.string :name
    end
  end
end
