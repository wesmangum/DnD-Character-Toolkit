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

  def modifiers
    modifiers = [str, dex, const, int, wis, cha]
    modifiers = modifiers.map do |int|
      if int >= 10
        int = ((int / 2)-5).floor
      else
        case int
        when 1
          int = -5
        when 2, 3
          int = -4
        when 4, 5
          int = -3
        when 6, 7
          int = -2
        when 8, 9
          int = -1
        end
      end
      int
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
