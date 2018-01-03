require_relative "employee"
require_relative "die"
require_relative "bonus_basket"

module CarDealership

    module WorkShift

    	def self.shift(employee)
            
    		die = Die.new
            number_rolled = die.roll
                if number_rolled.odd?
                    puts "#{@name} did not make the sale."
                else
                    employee.sale
                end

            bonus = BonusBasket.random
            employee.bonus_won(bonus)   

        end
            
    end
end