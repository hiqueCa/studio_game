require_relative 'player'

module HenrisStudioGame
    class ClumsyPlayer < Player

        def initialize(name, health=100)
            super(name, health)
            @w00t_bonus = 10
        end

        def find_treasure(treasure)
            points = treasure.points / 2.0
            new_treasure = Treasure.new(treasure.name, points)
            super(new_treasure) #super() is used inside a subclass method that overwrites the superclass mirrored method
        end

        def w00t
            @w00t_bonus.times {super}
        end
    end
end