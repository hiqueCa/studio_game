Treasure = Struct.new(:name, :points)

module HenrisStudioGame
    module TreasureTrove
        TREASURES = [
            Treasure.new(:pie, 5),
            Treasure.new(:bottle, 25),
            Treasure.new(:hammer, 50),
            Treasure.new(:skillet, 100),
            Treasure.new(:broomstick, 200),
            Treasure.new(:crowbar, 400)
        ]

        def self.to_s 
            puts "\nThere are #{TREASURES.size} treasures to be found:"

            TREASURES.each do |treasure|
                puts "A #{treasure.name} is worth #{treasure.points}"
            end
        end

        def self.random
            TREASURES.sample
        end
    end
end