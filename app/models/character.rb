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
