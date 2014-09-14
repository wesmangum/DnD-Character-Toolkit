class CreateClassses < ActiveRecord::Migration
  def change
    create_table :classses do |t|
      t.string :name

      t.timestamps
    end
  end
end
