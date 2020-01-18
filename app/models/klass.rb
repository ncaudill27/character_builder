class Klass < ActiveRecord::Base
  belongs_to :character
  has_many :skills
  has_many :proficiencies
end