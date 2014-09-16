require 'rails_helper'

RSpec.describe "Character Abilities" do
  it "should compare the abilities to the character for duplicates and pass" do
    user = Fabricate(:user)
    user.confirm!
    dd_class = Fabricate(:dd_class)
    race = Fabricate(:race)
    character = Character.new(user: user, dd_class: dd_class, race: race)
    selected_scores = {
      str: "11",
      dex: "12",
      const: "13",
      int: "14",
      wis: "15",
      cha: "16"
    }
    generated_scores = [11, 12, 13, 14, 15, 16]
    character.selected = selected_scores
    character.generated = generated_scores
    (character.update_attributes(selected_scores)).should == true
  end

  it "should compare the abilities to the character and fail because of greedy user" do
    user = Fabricate(:user)
    user.confirm!
    dd_class = Fabricate(:dd_class)
    race = Fabricate(:race)
    character = Character.new(user: user, dd_class: dd_class, race: race)
    selected_scores = {
      "str" => "16",
      "dex" => "16",
      "const" => "16",
      "int" => "16",
      "wis" => "16",
      "cha" => "16"
    }
    generated_scores = [11, 12, 13, 14, 15, 16]
    character.selected = selected_scores
    character.generated = generated_scores
    (character.send :abilities_match?, selected_scores, generated_scores).should_not eq true
  end

  it "should compare the abilities to the character and fail because of unfinished selection" do
    user = Fabricate(:user)
    user.confirm!
    dd_class = Fabricate(:dd_class)
    race = Fabricate(:race)
    character = Character.new(user: user, dd_class: dd_class, race: race)
    selected_scores = {
      "str" => "11",
      "dex" => "12",
      "const" => "13",
      "int" => "",
      "wis" => "",
      "cha" => ""
    }
    generated_scores = [11, 12, 13, 14, 15, 16]
    character.selected = selected_scores
    character.generated = generated_scores
    (character.send :abilities_selected?, selected_scores).should_not eq true
  end
end