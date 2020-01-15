class Character < ActiveRecord::Base
    validates :name, :klass, :race, :user_id, presence: true
    
    belongs_to :user

    def owner
        self.user.username
    end

    def stats
        {
            "Health Points" => "hp",
            "Strength" => "str",
            "Dexterity" => "dex",
            "Constitution" => "con",
            "Intelligence" => "int",
            "Wisdom" => "wis",
            "Charisma" => "cha"
        }
    end
end
#? Character.new.errors[:name].any? # => false (MAY NEED)