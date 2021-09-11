require_relative 'auditable'

module HenrisStudioGame
    class LoadedDie
        include Auditable

        def initialize
            @NUMBERS = [1, 1, 2, 3, 6, 6]
        end

        def roll
            @number = @NUMBERS.sample
            audit
        end
    end
end