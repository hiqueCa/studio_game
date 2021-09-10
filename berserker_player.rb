require_relative 'player'

class BerserkerPlayer < Player

    def initialize(name, health=100)
        super(name, health)
        @times_w00ted = 0
    end

    def berserk?
        @times_w00ted > 5
    end

    def w00t
        super
        @times_w00ted += 1

        if berserk?
            puts "Berserk mode activated for #{@name}!!!"
        end
    end

    def blam
        if berserk?
            w00t
        else
            super
        end
        """Using the ternary operator to achieve the same result:
        berserk? ? w00t:super"""
    end
end