# ##User Assigns Skill Points for a New Character

# As a User
# In order to determine my what my character is good at
# I want to assign skill points to different skills

# ###Acceptance Criteria
# * A Page appears, where the User sees their available Skill points
# * A User should be able to assign points to specific skills
# * A cross-class skill should deprecate the skill points by 2 for every 1 level
# * This tab should be blocked until Race and Class are selected

# ###Usage
# * Once Ability scores have been confirmed, User is prompted with score modifiers and all skills
#   * User will click arrows to add skill points to a specific skill
# * When they are satisfied with their skills, they will click "Submit Skills" to continue the Character Creation Process

feature "User assigns skill points", :js => true do
  background do
    fill_out_character([:race, :class, :abilities])
  end

  scenario "Happy path, user assigns points to each skill" do
    character = Character.last
    character.selected = {
      :str => "11",
      :dex => "12",
      :const => "13",
      :int => "14",
      :wis => "15",
      :cha => "16"
    }
    character.generated = [11, 12, 13, 14, 15, 16]
    expect(character.update_attributes(character.selected)).to eq true

    current_path.should == character_skills_path(character)
    expect(page).to have_content("Now that Ability scores are out of the way, let's figure out your character's skills.")
    expect(page).to have_css(".score", count: 6)

    expect(page).to have_css(".cross-class-skill", count: 4)
    expect(page).to have_css(".class-skill", count: 2)

    select(4, from: "Climb")
    select(2, from: "Concentration")
    select(2, from: "Heal")
    select(4, from: "Intimidate")
    select(2, from: "Move Silently")
    select(2, from: "Spellcraft")
    click_on "Submit Skills"

    current_path.should == character_description_index_path(character)

    character = Character.first
    expect(character.climb).to eq 4
    expect(character.concentration).to eq 2
    expect(character.heal).to eq 3
    expect(character.intimidate).to eq 7
    expect(character.move_silently).to eq 2
    expect(character.spellcraft).to eq 3
  end

  scenario "Happy path, user doesn't assign points to each skill" do
    character = Character.last
    character.selected = {
        :str => "11",
        :dex => "12",
        :const => "13",
        :int => "14",
        :wis => "15",
        :cha => "16"
    }
    character.generated = [11, 12, 13, 14, 15, 16]
    expect(character.update_attributes(character.selected)).to eq true

    current_path.should == character_skills_path(character)
    expect(page).to have_content("Now that Ability scores are out of the way, let's figure out your character's skills.")
    expect(page).to have_css(".score", count: 6)

    expect(page).to have_css(".cross-class-skill", count: 4)
    expect(page).to have_css(".class-skill", count: 2)

    select(4, from: "Climb")
    select(2, from: "Concentration")
    select(2, from: "Heal")
    select(4, from: "Intimidate")
    select(4, from: "Move Silently")
    click_on "Submit Skills"

    current_path.should == character_description_index_path(character)

    character = Character.first
    expect(character.climb).to eq 4
    expect(character.concentration).to eq 2
    expect(character.heal).to eq 3
    expect(character.intimidate).to eq 7
    expect(character.move_silently).to eq 3
    expect(character.spellcraft).to eq 2
    end

  scenario "Sad Path, User gets greedy" do
    character = Character.last
    character.selected = {
      :str => "11",
      :dex => "12",
      :const => "13",
      :int => "14",
      :wis => "15",
      :cha => "16"
    }
    character.generated = [11, 12, 13, 14, 15, 16]
    expect(character.update_attributes(character.selected)).to eq true

    current_path.should == character_skills_path(character)
    expect(page).to have_content("Now that Ability scores are out of the way, let's figure out your character's skills.")
    expect(page).to have_css(".score", count: 6)

    expect(page).to have_css(".cross-class-skill", count: 4)
    expect(page).to have_css(".class-skill", count: 2)

    expect(character.skill_points).to eq 16

    select(4, from: "Climb")
    select(4, from: "Concentration")
    select(4, from: "Heal")
    select(4, from: "Intimidate")
    select(4, from: "Move Silently")
    select(4, from: "Spellcraft")
    click_on "Submit Skills"

    current_path.should == character_skills_path(character)

    character = Character.first
    expect(character.climb).to be_nil
    expect(character.concentration).to be_nil
    expect(character.heal).to be_nil
    expect(character.intimidate).to be_nil
    expect(character.move_silently).to be_nil
    expect(character.spellcraft).to be_nil
  end
end