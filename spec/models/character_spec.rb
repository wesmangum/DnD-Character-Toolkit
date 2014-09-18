require 'rails_helper'

RSpec.describe "Character Abilities" do
  let!(:user) { Fabricate(:user) }
  let!(:dd_class) { Fabricate(:dd_class) }
  let!(:race) { Fabricate(:race) }
  let!(:character) { Character.new(user: user, dd_class: dd_class, race: race) }
  let!(:generated_scores) { [11, 12, 13, 14, 15, 16] }
  let!(:selected_scores) { {
        "str" => "11",
        "dex" => "12",
        "const" => "13",
        "int" => "14",
        "wis" => "15",
        "cha" => "16"
      } }

  before(:each) do
    seed_database()
    user.confirm!
  end

  describe "abilities_valid?" do
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
  end

  describe "get_modifiers" do
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

  describe "skill_points" do
    it "should determine the skill points of the character" do
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
      character.update_attributes(selected_scores)

      expect(character.skill_points).to eq 24
    end
  end

  describe "skills_valid?" do
    before(:each) do
      character.selected = selected_scores
      character.generated = generated_scores
      character.update_attributes(selected_scores)
    end

    it "should compare the skills points with the user's selection and pass" do
      selected_points = {
        "climb" => "4",
        "concentration" => "4",
        "heal" => "6",
        "intmimdate" => "4",
        "move_silently" => "4",
        "spellcraft" => "6"
      }

      character.skills = selected_points
      (character.send :skill_points_match?, selected_points).should eq true
      (character.send :skill_points_selected?, selected_points).should eq true
    end

    it "should compare the skills points with the user's selection and fail because of greedy user" do
      selected_points = {
        "climb" => "4",
        "concentration" => "4",
        "heal" => "8",
        "intmimdate" => "8",
        "move_silently" => "4",
        "spellcraft" => "8"
      }

      character.skills = selected_points
      (character.send :skill_points_match?, selected_points).should_not eq true
    end

    it "should compare the skills points with the user's selection and fail because of unfinished selection" do
      selected_points = {
        "climb" => "4",
        "concentration" => "4",
        "heal" => "8",
        "intmimdate" => "8",
        "move_silently" => "",
        "spellcraft" => ""
      }

      character.skills = selected_points
      (character.send :skill_points_selected?, selected_points).should_not eq true
    end
  end

  describe "save_skill_points" do
    before(:each) do
      character.selected = selected_scores
      character.generated = generated_scores
      character.update_attributes(selected_scores)
    end

    it "should save the skill points with base points and user selects points and pass" do
      selected_points = {
        "climb" => "4",
        "concentration" => "4",
        "heal" => "4",
        "intimidate" => "4",
        "move_silently" => "2",
        "spellcraft" => "2"
      }

      character.skills = selected_points

      (character.save_skill_points(selected_points)).should eq true

      expect(character.climb).to eq 4
      expect(character.concentration).to eq 5
      expect(character.heal).to eq 4
      expect(character.intimidate).to eq 5
      expect(character.move_silently).to eq 3
      expect(character.spellcraft).to eq 3

    end
  end
end