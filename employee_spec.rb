require "car_dealership/employee"

module CarDealership

	describe do

		before do
			@initial_cars_sold = 24
			@employee = Employee.new("Janice", @initial_cars_sold)
			$stdout = StringIO.new
		end

		  it "has a capitalized name" do
			expect(@employee.name).to eq("Janice")
		  end

		  it "has a string representation" do
			expect(@employee.to_s).to eq("Hi, I'm Janice, I've sold 24 cars, and I'd love to help you find the perfect vehicle!")
		  end

		  it "computes a rank as the sum of cars sold and bonuses" do
			@employee.bonus_won(Bonus.new(:"Outstanding Customer Service", 50))
			@employee.bonus_won(Bonus.new(:"Outstanding Customer Service", 50))

			expect(@employee.rank).to eq(124)
		  end

		  it "increases cars sold by 1 when a car is sold" do
		  	@employee.sale

			expect(@employee.cars_sold).to eq(@initial_cars_sold + 1)
		  end

		context "created without a cars sold amount" do
			before do
				@employee = Employee.new("Janice")
			end

		  it "has a default cars_sold amount of 0" do
			expect(@employee.cars_sold).to eq(0)
		  end
		end

		context "when cars sold is equal to or greater than 40" do
			before do
				@employee = Employee.new("Janice", 40)
			end

		  it "is a great salesperson" do
			expect(@employee).to be_great_salesperson
		  end
		end

		context "when cars sold is less than 40" do
			before do 
				@employee = Employee.new("Janice", 24)
			end

		  it "is a bad salesperson" do
		  	expect(@employee).not_to be_great_salesperson
		  end
		end

		context "in a collection of employees" do
	  		before do
	    		@employee1 = Employee.new("Janice", 10)
	    		@employee2 = Employee.new("Ben", 20)
	    		@employee3 = Employee.new("Susan", 30)

	    		@employees = [@employee1, @employee2, @employee3]
	  		end

	  	  it "is sorted by decreasing cars_sold" do
	    	expect(@employees.sort).to eq([@employee3, @employee2, @employee1]) 
	  	  end
		end

		it "computes bonuses as the sum of bonus amounts" do
			expect(@employee.amounts).to eq(0)

			expect(@employee.bonus_won(Bonus.new(:"Outstanding Customer Service", 50)))

			expect(@employee.amounts).to eq(50)

			expect(@employee.bonus_won(Bonus.new(:"Most Commission from a Single Sale", 75)))

			expect(@employee.amounts).to eq(125)

			expect(@employee.bonus_won(Bonus.new(:"Outstanding Customer Service", 50)))

			expect(@employee.amounts).to eq(175)
		end

		it "yields each bonus won and its total amounts" do
			@employee.bonus_won(Bonus.new(:Attendance, 100))
			@employee.bonus_won(Bonus.new(:"Outstanding Customer Service", 50))
			@employee.bonus_won(Bonus.new(:"Most Commission from a Single Sale", 75))
			@employee.bonus_won(Bonus.new(:"Most Commission from a Single Sale", 75))
			@employee.bonus_won(Bonus.new(:"Most Commission from a Single Sale", 75))
			@employee.bonus_won(Bonus.new(:Attendance, 100))
			@employee.bonus_won(Bonus.new(:Attendance, 100))
			@employee.bonus_won(Bonus.new(:Attendance, 100))

			yielded = []
			@employee.each_bonus_won do |bonus|
				yielded << bonus
			end

			expect(yielded).to eq([
				Bonus.new(:"Attendance", 400),
				Bonus.new(:"Outstanding Customer Service", 50),
				Bonus.new(:"Most Commission from a Single Sale", 225)
			])
		end

		it "can be created from a CSV string" do
			employee = Employee.from_csv("Janice", 24)

			expect(employee.name).to eq("Janice")
			expect(employee.cars_sold).to eq(24)
		end
	end
end
