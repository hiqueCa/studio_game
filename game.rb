require_relative 'player'

class Game 
    """Class for managing game state and methods in general"""
    attr_reader :title

    def initialize(title)
        @title = title
        @players = Array.new #Explicit way of creating new arry in Ruby == @players = []
    end

    def add_player(player)
        @players.push(player) #Same as doing @players << player
    end

    def play 
        puts "The game has #{@players.size} players in #{@title}"
        puts @players

        @players.each do |player|
            player.w00t
            player.w00t
            player.blam
            puts player
        end
    end
end

"""Some example code below on the usage of the Game class"""
if __FILE__ == $PROGRAM_NAME
    example_game = Game.new("Call of Duty")
    this_player = Player.new("Gabi", 65)
    example_game.add_player(this_player)
    example_game.play
end