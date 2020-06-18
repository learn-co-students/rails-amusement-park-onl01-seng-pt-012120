class Ride < ActiveRecord::Base
	belongs_to :user
	belongs_to :attraction

	def take_ride
		# 1. Enough Tickets
		# 2. Tall Enough
		# 3. Not Tall Enough && Not Enough Tickets
		# 4. Updates Ticket Number
		# 5. Updates user.nausea based on attraction.nausea_rating
		# 6. Updates user.happiness based on attraction.happiness_rating
		if enough_tickets? && tall_enough?
			self.user.update(tickets: update_tickets, nausea: update_nausea, happiness: update_happiness)
			"Thanks for riding the #{attraction.name}!"
		elsif !enough_tickets? && !tall_enough?
			"Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
		else
			if !enough_tickets?
				"Sorry. You do not have enough tickets to ride the #{attraction.name}."
			elsif !tall_enough?
				"Sorry. You are not tall enough to ride the #{attraction.name}."
			end
		end
	end

	private

	def update_tickets
		self.user.tickets - self.attraction.tickets
	end

	def update_nausea
		self.user.nausea + self.attraction.nausea_rating
	end

	def update_happiness
		self.user.happiness + self.attraction.happiness_rating
	end

	def enough_tickets?
		self.user.tickets >= self.attraction.tickets
	end

	def tall_enough?
		self.user.height >= self.attraction.min_height
	end
end
