module CarDealership

	Bonus = Struct.new(:name, :amounts)

	module BonusBasket

		BONUSES = [
			Bonus.new(:"Outstanding Customer Service", 50),
			Bonus.new(:"Most Commission from a Single Sale", 75),
			Bonus.new(:Attendance, 100),
			Bonus.new(:"Top Salesperson", 200)
			]

		def self.random
			BONUSES.sample
		end
	end
end