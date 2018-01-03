
require_relative '../lib/car_dealership/employee'
require_relative '../lib/car_dealership/dealership'

module CarDealership

        #employee1 = Employee.new("Janice",24)
        #employee2 = Employee.new("Ben", 32)
        #employee3 = Employee.new("Susan", 76)

        dealership = CarDealership::Dealership.new("MJ's Car Dealership") 
        default_employee_file = File.join(File.dirname(__FILE__), 'employees.csv')    
        dealership.load_employees(ARGV.shift || default_employee_file)

        #dealership.add_employee(employee1)
        #dealership.add_employee(employee2)
        #dealership.add_employee(employee3)

        loop do      
           puts "\nHow many shifts? ('quit' to exit)"
           answer = gets.chomp.downcase
           case answer
           when /^\d+$/
             dealership.work(answer.to_i)
           when 'quit' , 'exit'
             dealership.print_stats
             break
           else
             puts "Please enter a mumber or 'quit'"
           end
        end

        dealership.save_rank

end

