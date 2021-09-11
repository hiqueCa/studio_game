require_relative 'die'
require_relative 'player'
require_relative 'loaded_die'

module HenrisStudioGame
    module PlayersLifeChanger
        """Module for storing specific methods used inside the game project without the need for empty state classes"""

        #This module method could be instantiated as self.check_die_number_and_change_players_life(player)
        def self.check_die_number_and_change_players_life(player)
            die = Die.new
            number_rolled_in_die = die.roll

            case number_rolled_in_die
            when 1..2
                player.blam
            when 3..4
                player.skip
            else
                player.w00t
            end
        end
    end
end

"""Since we always work with methods, we always need to define who is the receiver of the method.
As we are working with a Module, not a class per se, every new method created 'independetly' 
needs to be defined as a self.something() method. This way, the example code below show how to work
with a method from modules.
For information purposes, modules are useful for storing Classes, Methods and constants."""

if __FILE__ == $PROGRAM_NAME
    player = HenrisStudioGame::Player.new("Michael", 80)
    HenrisStudioGame::PlayersLifeChanger.check_die_number_and_change_players_life(player)
end