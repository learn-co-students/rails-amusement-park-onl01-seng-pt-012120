class User < ActiveRecord::Base
    has_secure_password
    has_many :rides
    has_many :attractions, through: :rides

    def mood
        if self.admin == false
            if self.happiness > self.nausea
                "happy"
            elsif self.nausea > self.happiness
                "sad"
            else
                "content"
            end
        else
            "N/A"
        end
    end
end
