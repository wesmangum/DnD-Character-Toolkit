require 'rails_helper'

RSpec.describe Skill, :type => :model do
  let!(:user) { Fabricate(:user) }
  let!(:character) { Character.new(user: user, dd_class: Fabricate(:dd_class), race: Fabricate(:race), str: 11, dex: 12, const: 13, wis: 14, int: 15, cha: 16) }
  let!(:appraise) { Skill.new(name: "Appraise", key_ability: "int", fighter_proficiency: 2, monk_proficiency: 2, wizard_proficiency: 2) }

  it "should determine the base score of a Skill based on the character's ability score" do
    appraise_modifier = character.get_modifiers(appraise.key_ability)
    (appraise_modifier).should == 2
  end

  it "should determine the amount of points a character can invest in a skill" do
    appraise_choices = character.check_proficiency(appraise)
    (appraise_choices).should == [2, 4, 6, 8]
  end
end
