require_relative 'player'
require_relative 'die'
require_relative 'players_life_changer'
require_relative 'player_classifier'
require_relative 'treasure_trove'

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

    def show_statistics
        final_categories = @players.partition {|player| player.strong?}

        puts "\n#{@title} statistics"
        PlayersClassifier.show_players_statistics(final_categories)

        puts "\n#{@title} High Scores:"
        PlayersClassifier.show_classified_players_high_scores(@players)
    end

    def play(rounds)
        available_treasures = TreasureTrove::TREASURES
        puts TreasureTrove
        puts "\nThe game has #{@players.size} players in #{@title} and will be played in #{rounds} rounds"
        puts @players

        1.upto(rounds) do |round| 
            puts "\nRound N.#{round}"
            @players.each do |player|
                PlayersLifeChanger.check_die_number_and_change_players_life(player)
            end
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