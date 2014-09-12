class Character < ActiveRecord::Base
   belongs_to :user
   has_one :race
end
