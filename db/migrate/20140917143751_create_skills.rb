class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.string :name
      t.string :key_ability
      t.integer :fighter_proficiency
      t.integer :wizard_proficiency
      t.integer :monk_proficiency
    end
  end
end
