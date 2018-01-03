require_relative "die"
require_relative "employee"
require_relative "work_shift"
require_relative "bonus_basket"
require "csv"

module CarDealership

    class Dealership
        
        attr_reader :title

        def initialize(title)
            @title = title
            @employees = []
        
        end

        def add_car (a_car)
            @cars.push(a_car)
        end

        def add_employee(a_employee)
            @employees.push(a_employee)
        end

        def load_employees(from_file)
            CSV.foreach(from_file) do |row|
                employee = Employee.new(row[0], row[1].to_i)
                add_employee(employee)
            end
        end

        def work (rounds)
            puts "There are #{@employees.size} employees at #{@title}:"

            @employees.each do |employee|
                puts employee 
            end

            bonuses = BonusBasket::BONUSES
            puts "\nThere are #{bonuses.size} possible bonuses to win:"
                bonuses.each do |bonus|
                    puts "A #{bonus.name} bonus is worth $#{bonus.amounts}!"
                end

            1.upto(rounds) do |round|
                puts "\nRound #{round}:"
                @employees.each do |employee|
                  WorkShift.shift(employee)
                  puts employee
                end
            end            

        end

        def save_rank(to_file="rank.txt")
            File.open(to_file, "w") do |file|
                file.puts "#{@title} Employee Rank:"
                @employees.sort.each do |employee|
                    file.puts print_name_and_rank(employee)
                end
            end
        end

        def total_amounts
            @employees.reduce(0) { |sum, employee| sum + employee.amounts }
        end

        def print_name_and_rank(employee)
            formatted_name = employee.name.ljust(20, '.')
        	puts "#{formatted_name} (#{employee.rank})"        
        end

        def print_name_and_cars_sold(employee)
            puts "#{employee.name} (#{employee.cars_sold})"
        end

        def print_stats
            puts "\n#{@title} Statistics:"
            
            great_salespeople, bad_salespeople = @employees.partition { |employee| employee.great_salesperson? }
        	

        	puts "\n#{great_salespeople.size} Great Salespeople:"
        	great_salespeople.each do |employee|
                print_name_and_cars_sold(employee)
            end

        	puts "\n#{bad_salespeople.size} Bad Salespeople:"
        	bad_salespeople.each do |employee|
        		print_name_and_cars_sold(employee)
            end

        	puts "\n#{@title} Sales Ranks:"	
        	   @employees.sort.each do |employee|
        		print_name_and_rank(employee)
        	end

            @employees.sort.each do |employee|
            puts "\n#{employee.name}'s bonus amount totals:"
            employee.each_bonus_won do |bonus|
                puts "$#{bonus.amounts} total #{bonus.name} bonuses"
            end
            puts "$#{employee.amounts} total in bonuses"
            end
            
            puts "\n$#{total_amounts} is the total amount from bonuses won!"
        end
    end 
end