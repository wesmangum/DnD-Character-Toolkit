class Character < ActiveRecord::Base
   belongs_to :user
   belongs_to :race
   belongs_to :dd_class
end
