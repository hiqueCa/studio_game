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

    def read_each_player_from_file(from_file)
        File.readlines(from_file).each do |line|
            player = Player.create_player_from_csv(line)
            yield player
        end
    end

    def load_players(from_file)
        read_each_player_from_file(from_file) do |player|
            puts "Adding #{player.name}..."
            add_player(player)
            puts "#{player.name} added!"
        end
    end

    def save_high_scores(to_file = "high_scores.txt")
        File.open(to_file, "w") do |file|
            file.puts "#{@title} High Scores:"
            sorted_players = @players.sort
            sorted_players.each do |player|
                player_formatted_string = player.format_player_high_score_output
                file.puts player_formatted_string
            end
        end
    end

    def add_player(player)
        @players.push(player) #Same as doing @players << player
    end

    def treasure_points_statistics
        @players.sort.each do |player|
            puts "\n#{player.name}'s point totals:\n"

            player.each_found_treasure do |treasure|
                puts "#{treasure.points} points from #{treasure.name}.\n"
            end

            puts "-------------------"
            puts "#{player.treasure_points} grand total points"
        end
    end

    def show_statistics
        final_categories = @players.partition {|player| player.strong?}

        puts "\n#{@title} statistics"
        PlayersClassifier.show_players_statistics(final_categories)

        puts "\n#{@title} High Scores:"
        PlayersClassifier.show_classified_players_high_scores(@players)

        treasure_points_statistics
    end

    def play(rounds)
        puts TreasureTrove
        puts "\nThe game #{@title} has #{@players.size} players and will be played in #{rounds} rounds"
        puts @players

        1.upto(rounds) do |round| 
            puts "\nRound N.#{round}"
            @players.each do |player|
                PlayersLifeChanger.check_die_number_and_change_players_life(player)
                found_treasure = TreasureTrove.random
                player.find_treasure(found_treasure)
            end
        end
        puts @players
    end

    def total_treasure_points
        total_points = 0

        @players.each do |player|
            total_points += player.treasure_points
        end

        total_points
    end
end

"""Some example code below on the usage of the Game class"""
if __FILE__ == $PROGRAM_NAME
    example_game = Game.new("Call of Duty")
    this_player = Player.new("Gabi", 65)
    example_game.add_player(this_player)
    example_game.play
end