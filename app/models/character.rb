class Character < ActiveRecord::Base
   belongs_to :user
   belongs_to :race
   belongs_to :dd_class

   def abilities_match?(selected, generated)
    selected = selected.values.map { |num| num.to_i }
    selected.sort == generated.sort
   end
end
