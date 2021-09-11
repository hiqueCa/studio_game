require_relative 'auditable'

module HenrisStudioGame
    class Die
        include Auditable
        """Class for managing Die class states and behaviors"""
        attr_reader :number

        def initialize
            roll
        end

        def roll
            @number = rand(1..6)
            audit
            @number
        end
    end
end
