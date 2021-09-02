require_relative 'player'
require_relative 'die'
require_relative 'players_life_changer'

class Game 
    """Class managing game state and methods in general"""
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
            PlayersLifeChanger.check_die_number_and_change_players_life(player)
        end
        puts @players
    end
end

"""Some example code below on the usage of the Game class"""
if __FILE__ == $PROGRAM_NAME
    example_game = Game.new("Call of Duty")
    this_player = Player.new("Gabi", 65)
    example_game.add_player(this_player)
    example_game.play
end