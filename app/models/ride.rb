class Ride < ActiveRecord::Base
    belongs_to :attraction
    belongs_to :user


def take_ride
    msg = ""
    if user.tickets < attraction.tickets 
        msg << "Sorry. You do not have enough tickets to ride the #{attraction.name}."
        elsif user.height < attraction.min_height
            msg << "Sorry. You are not tall enough to ride the #{attraction.name}."
        elsif user.tickets >= attraction.tickets && user.height >= attraction.min_height
            user.tickets -= attraction.tickets 
            user.nausea += attraction.nausea_rating
            user.happiness += attraction.happiness_rating
            user.save
        msg << "Thanks for riding the #{self.attraction.name}!"
         else
        #  msg << "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
        msg.join(" ")
    end
   end
  end


    