require 'rails_helper'

RSpec.describe "Character Abilities" do
  let!(:user) { Fabricate(:user) }
  let!(:dd_class) { Fabricate(:dd_class) }
  let!(:race) { Fabricate(:race) }
  let!(:character) { Character.new(user: user, dd_class: dd_class, race: race) }
  let!(:generated_scores) { [11, 12, 13, 14, 15, 16] }

  before(:each) do
    user.confirm!
  end

  it "should compare the abilities to the character for duplicates and pass" do
    selected_scores = {
      "str" => "11",
      "dex" => "12",
      "const" => "13",
      "int" => "14",
      "wis" => "15",
      "cha" => "16"
    }
    character.selected = selected_scores
    character.generated = generated_scores
    (character.send :abilities_match?, selected_scores, generated_scores).should eq true
    (character.send :abilities_selected?, selected_scores).should eq true
  end

  it "should compare the abilities to the character and fail because of greedy user" do
    selected_scores = {
      "str" => "16",
      "dex" => "16",
      "const" => "16",
      "int" => "16",
      "wis" => "16",
      "cha" => "16"
    }
    character.selected = selected_scores
    character.generated = generated_scores
    (character.send :abilities_match?, selected_scores, generated_scores).should_not eq true
  end

  it "should compare the abilities to the character and fail because of unfinished selection" do
    selected_scores = {
      "str" => "11",
      "dex" => "12",
      "const" => "13",
      "int" => "",
      "wis" => "",
      "cha" => ""
    }
    character.selected = selected_scores
    character.generated = generated_scores
    (character.send :abilities_selected?, selected_scores).should_not eq true
  end

  it "should calculate the modifiers based on ability scores and pass" do
    selected_scores = {
      "str" => "7",
      "dex" => "8",
      "const" => "10",
      "int" => "12",
      "wis" => "15",
      "cha" => "16"
    }
    character.selected = selected_scores
    character.generated = generated_scores
    (character.update_attributes(selected_scores)).should eq true

    expect(character.get_modifiers).to eq [-2, -1, 0, 1, 2, 3]
  end
end