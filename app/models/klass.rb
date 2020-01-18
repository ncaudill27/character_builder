class Klass < ActiveRecord::Base
  belongs_to :character
  has_many :skills, 
end