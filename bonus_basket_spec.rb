require "car_dealership/bonus_basket"

module CarDealership

	describe Bonus do

		before do
			@bonus = Bonus.new(:most_cars_sold, 200)
			$stdout = StringIO.new
		end

		it "has a name attribute" do
			expect(@bonus.name).to eq(:most_cars_sold)
		end

		it "has an amount attribute" do
			expect(@bonus.amounts).to eq(200)
		end

	end

	describe BonusBasket do
		
		it "has four bonus amounts" do
			expect(BonusBasket::BONUSES.size).to eq(4)
		end

		it "has a best customer service bonus worth $50" do
			expect(BonusBasket::BONUSES[0]).to eq( Bonus.new(:"Outstanding Customer Service", 50))
		end

		it "has a most commission from a single sale bonus worth $75" do
			expect(BonusBasket::BONUSES[1]).to eq( Bonus.new(:"Most Commission from a Single Sale", 75))
		end

		it "has a best attendance bonus worth $100" do
			expect(BonusBasket::BONUSES[2]).to eq( Bonus.new(:Attendance, 100))
		end

		it "has a most cars sold bonus worth $200" do
			expect(BonusBasket::BONUSES[3]).to eq( Bonus.new(:"Top Salesperson", 200))
		end
	end 
end