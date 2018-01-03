require_relative "bonus_basket"

module CarDealership

    class Employee

        attr_accessor :name, :cars_sold

        def initialize (name, cars_sold = 0, commission = 0)
            @name = name.capitalize
            @cars_sold = cars_sold
            @bonuses_won = Hash.new(0)
        end

     def <=>(other)
        	other.rank <=> rank
        end

        def to_s
            "Hi, I'm #{@name}, I've sold #{@cars_sold} cars, and I'd love to help you find the perfect vehicle!"
        end

        def sale
            @cars_sold += 1
             puts "#{@name} has made a sale and has sold #{@cars_sold} cars!"
        end

        def great_salesperson?
            @cars_sold >= 40
        end

        def rank
        	@cars_sold + amounts
        end

        def amounts
            @bonuses_won.values.reduce(0, :+)
        end

        def bonus_won(bonus)
            @bonuses_won[bonus.name] += bonus.amounts
            puts "#{@name} won a #{bonus.name} bonus worth $#{bonus.amounts}!" 
            puts "#{@name}'s Bonuses: {bonuses_won}"
        end

        def each_bonus_won 
            @bonuses_won.each do |name, amounts|
                yield Bonus.new(name, amounts)
            end
        end

        def self.from_csv(strimg)
            name, cars_sold = string.split(',')
            Employee.new(name, Integer(cars_sold))
        end
    end
end  