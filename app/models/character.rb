class Character < ActiveRecord::Base
    validates :name, :race, :klass, :user_id, presence: true
    belongs_to :user
    has_one :race
    has_one :klass
    has_many :skills, through: :klass
    has_many :proficiencies, through: :klass
    def owner
        self.user.username
    end

    def stats
        {
            "Strength" => "str",
            "Dexterity" => "dex",
            "Constitution" => "con",
            "Intelligence" => "int",
            "Wisdom" => "wis",
            "Charisma" => "cha"
        }
    end

    def incomplete?
        self.stats.values.collect{|stat| self.send(stat)}.any?("")
    end
end
#? Character.new.errors[:name].any? # => false (MAY NEED)