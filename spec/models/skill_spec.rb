require 'rails_helper'

RSpec.describe Skill, :type => :model do
  let!(:user) { Fabricate(:user) }
  let!(:character) { Character.new(user: user, dd_class: Fabricate(:dd_class), race: Fabricate(:race), str: 11, dex: 12, const: 13, wis: 14, int: 15, cha: 16) }
  let!(:appraise) { Skill.new(name: "Appraise", key_ability: "int", fighter_proficiency: 2, wizard_proficiency: 2) }

  it "should determine the base score of a Skill based on the character's ability score" do
    appraise_modifier = character.get_modifiers([appraise.key_ability])
    (appraise_modifier).should == [2]
  end
end
