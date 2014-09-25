class AddMoreClassesToSkills < ActiveRecord::Migration
  def change
    add_column :skills, :barbarian_proficiency, :integer
    add_column :skills, :bard_proficiency, :integer
    add_column :skills, :cleric_proficiency, :integer
    add_column :skills, :druid_proficiency, :integer
    add_column :skills, :paladin_proficiency, :integer
    add_column :skills, :ranger_proficiency, :integer
    add_column :skills, :rogue_proficiency, :integer
    add_column :skills, :sorcerer_proficiency, :integer
  end
end
