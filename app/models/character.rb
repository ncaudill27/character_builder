class Character < ActiveRecord::Base
    belongs_to :user

    def owner
        User.find(self.user_id).username
    end

    def stats
        {
            "Health Points" => self.hp,
            "Strength" => self.str,
            "Dexterity" => self.dex,
            "Constitution" => self.con,
            "Intelligence" => self.int,
            "Wisdom" => self.wis,
            "Charisma" => self.cha
        }
    end
end
#? Character.new.errors[:name].any? # => false (MAY NEED)