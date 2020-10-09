class User < ActiveRecord::Base
    has_many :rides
    has_many :attractions, through: :rides

    has_secure_password
    
    validates :name, presence: true, uniqueness: true
    
    def not_admin?
        !self.admin
    end 

    def mood
        if not_admin?
            if self.nausea > self.happiness
                @mood = "sad"
            elsif self.happiness > self.nausea
                @mood = "happy"
            end
        end
    end

end
