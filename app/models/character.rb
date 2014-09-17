class Character < ActiveRecord::Base
  belongs_to :user
  belongs_to :race
  belongs_to :dd_class
  validate :abilities_valid?, on: :update

  attr_accessor :selected, :generated

  def abilities_valid?
    unless selected.nil? && generated.nil?
      unless abilities_match?(selected, generated) && abilities_selected?(selected)
        errors[:base] << "The character could not be saved."
      end
    end
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
    modifiers
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
    points = (base * get_modifiers("int")[0].to_i) * 4
    race.name == "Human" ? points += 4 : points
    points
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
end
