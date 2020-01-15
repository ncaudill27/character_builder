class Character < ActiveRecord::Base
    belongs_to :user
end
#? Character.new.errors[:name].any? # => false (MAY NEED)