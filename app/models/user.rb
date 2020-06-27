class User < ActiveRecord::Base

    has_many :rides
    has_many :attractions, through: :rides
    has_secure_password


    def self.mood
        if self.happiness > self.nausea
            return "Happy"
        else
            return"Sad"
    end
end
end
