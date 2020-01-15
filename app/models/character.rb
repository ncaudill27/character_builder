class Character < ActiveRecord::Base
    belongs_to :user

    def owner
        User.find(self.user_id).username
    end
end
#? Character.new.errors[:name].any? # => false (MAY NEED)