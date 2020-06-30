class Ride < ActiveRecord::Base
    belongs_to :attraction
    belongs_to :user

    def take_ride
        user = self.user
        attraction = self.attraction
        if user.tickets < attraction.tickets && user.height < attraction.min_height
            "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
        elsif user.tickets < attraction.tickets
            "Sorry. You do not have enough tickets to ride the #{attraction.name}."
        elsif user.height < attraction.min_height
            "Sorry. You are not tall enough to ride the #{attraction.name}."
        else
            a = user.tickets - attraction.tickets
            b = user.nausea + attraction.nausea_rating
            c = user.happiness + attraction.happiness_rating
            user.update(nausea: b, happiness: c, tickets: a)
            "Thanks for riding the #{attraction.name}!"
        end

    end

end
