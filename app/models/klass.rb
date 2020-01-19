class Klass < ActiveRecord::Base
  has_many :characters
  has_many :skills
  has_many :proficiencies
end