class Character < ActiveRecord::Base
  belongs_to :user
  belongs_to :race
  belongs_to :dd_class
  validate :abilities_valid?, on: :update
  validate :skills_valid?, on: :save

  attr_accessor :selected, :generated, :skills

  def abilities_valid?
    unless selected.nil? && generated.nil?
      unless abilities_match?(selected, generated) && abilities_selected?(selected)
        errors[:base] << "The character could not be saved."
      end
    end
  end

  def check_proficiency(skill)
    symbol = "#{dd_class.name.downcase}_proficiency".to_sym
    proficiency = skill[symbol]
    proficiency == 1 ? [1, 2, 3, 4] : [2, 4, 6, 8]
  end

  def get_modifiers(ability=["str", "dex", "const", "int", "wis", "cha"])
    modifiers = [ability].flatten
    modifiers = modifiers.map do |i|
      i = self[i]
      if i >= 10
        i = ((i / 2)-5).floor
      else
        case i
        when 2, 3
          i = -4
        when 4, 5
          i = -3
        when 6, 7
          i = -2
        when 8, 9
          i = -1
        end
      end
      i
    end
    modifiers.length == 1 ? modifiers[0] : modifiers
  end

  def save_skill_points(points)
    points.each do |key, value|
      name = key.to_s.tr("_", " ").split.map(&:capitalize).join(" ")
      skill_table_entry = Skill.find_by(name: name)
      selected_point = value.to_i
      self[key] = add_points(skill_table_entry, value)
    end
    self.save
  end

  def skill_points
    base = 0
    case dd_class.name
    when "Cleric", "Fighter", "Paladin", "Sorcerer", "Wizard"
      base = 2
    when "Barbarian", "Druid", "Monk"
      base = 4
    when "Bard", "Ranger"
      base = 6
    when "Rogue"
      base = 8
    end
    points = (base + get_modifiers("int").to_i) * 4
    points < 4 ? points = 4 : points
    race.name == "Human" ? points += 4 : points
    points
  end

  def skills_valid?
    unless skills.nil?
      unless skill_points_match?(skills) && skill_points_selected?(skills)
        errors[:base] << "The character could not be saved."
      end
    end
  end

  private

  def abilities_match?(selected, generated)
    selected = selected.values.map { |num| num.to_i }
    selected.sort == generated.sort
  end

  def abilities_selected?(selected)
    selected = selected.values.map { |num| num.length < 1 ? nil : num.to_i }
    selected.compact.length == 6
  end

  def add_points(skill, selected_points)
    if check_proficiency(skill) == [1, 2, 3, 4]
      selected_points.to_i + get_modifiers(skill.key_ability)
    elsif check_proficiency(skill) == [2, 4, 6, 8]
      (selected_points.to_i/2) + get_modifiers(skill.key_ability)
    else
      return nil
    end
  end

  def skill_points_match?(skills)
    skills = skills.values.map { |num| num.to_i }
    skills.sum == skill_points
  end

  def skill_points_selected?(skills)
    skills = skills.values.map { |num| num.length < 1 ? nil : num.to_i }
    skills.compact.length == 6
  end
end
