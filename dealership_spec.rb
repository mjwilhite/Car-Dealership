require "car_dealership/dealership"

module CarDealership

	describe Dealership do
		
		before do
			@dealership = Dealership.new("MJ's Car Dealership")

			@initial_cars_sold = 50
			@employee = Employee.new("Janice", @initial_cars_sold)

			@dealership.add_employee(@employee)
		end

		it "makes a sale when an even number is rolled" do
			allow_any_instance_of(Die).to receive(:roll).and_return(4)

			@dealership.work(2)

			expect(@employee.cars_sold).to eq(@initial_cars_sold + (1 * 2))
		end

		it "is skipped when an odd number is rolled" do
			allow_any_instance_of(Die).to receive(:roll).and_return(1)

			@dealership.work(2)

			expect(@employee.cars_sold).to eq(@initial_cars_sold)
		end

		it "assigns a bonus for a bonus amount during an employee's shift" do
			dealership = Dealership.new("MJ's Car Dealership")
			employee = Employee.new("Janice", 24)

			dealership.add_employee(employee)

			dealership.work(1)

			expect(employee.amounts).not_to be_zero
		end

		it "computes total amounts as the sum of all employee bonuses" do
			dealership = Dealership.new("MJ's Car Dealership")

			employee1 = Employee.new("Janice")
	        employee2 = Employee.new("Ben",)

	        dealership.add_employee(employee1)
	        dealership.add_employee(employee2)

	        employee1.bonus_won(Bonus.new(:"Outstanding Customer Service", 50))
	        employee1.bonus_won(Bonus.new(:"Outstanding Customer Service", 50))
	        employee2.bonus_won(Bonus.new(:"Most Commission from a Single Sale", 75))

	        expect(dealership.total_amounts).to eq(175)
	    end
	end
end