class Ride < ApplicationRecord
    belongs_to :user
    belongs_to :attraction
    validates :user_id, presence: true
    validates :attraction_id, presence: true 
    
     
    def take_ride
        if user_has_enough_tickets? && user_tall_enough?
            update_stats
            "Thanks for riding the #{attraction.name}!"
        elsif !user_has_enough_tickets? && !user_tall_enough?
            "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
        elsif !user_has_enough_tickets?
            "Sorry. You do not have enough tickets to ride the #{attraction.name}."
        elsif !user_tall_enough?
            "Sorry. You are not tall enough to ride the #{attraction.name}."
        end
    end

    private

    def user_has_enough_tickets?
        user.tickets >= attraction.tickets
    end

    def user_tall_enough?
        user.height >= attraction.min_height
    end

    def update_stats
        tix = user.tickets - attraction.tickets
        happiness = user.happiness + attraction.happiness_rating
        nausea = user.nausea + attraction.nausea_rating
        user.update(tickets: tix, happiness: happiness, nausea: nausea)
    end

end
