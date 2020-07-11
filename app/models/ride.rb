class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction

    def take_ride
        #byebug
        if self.attraction.min_height > self.user.height && self.user.tickets < self.attraction.tickets
            "Sorry. You do not have enough tickets to ride the Roller Coaster. You are not tall enough to ride the Roller Coaster."
        elsif self.user.tickets < self.attraction.tickets
            "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
        elsif self.attraction.min_height > self.user.height
            "Sorry. You are not tall enough to ride the #{self.attraction.name}."
        else
            self.user.happiness += self.attraction.happiness_rating
            self.user.tickets -= self.attraction.tickets
            self.user.nausea += self.attraction.nausea_rating
            user.save
            "Thanks for riding the #{self.attraction.name}!"
        end
    end
end
