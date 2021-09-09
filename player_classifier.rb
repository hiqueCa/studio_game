require_relative 'player'
require_relative 'game'

module PlayersClassifier
    def self.show_players_statistics(players)
        count = 0
        
        players.each do |category|
            if count == 0 
                puts "#{category.length} strong player(s):\n"
            else
                puts "\n#{category.length} wimpy player(s):\n"
            end
            category.each {|player| puts "#{player.name} (#{player.health})"}
            count += 1
        end
    end

    def self.show_classified_players_high_scores(players)
        sorted_players = players.sort
        sorted_players.each do |player|
            player_formatted_string = player.format_player_high_score_output
            puts player_formatted_string
        end
    end
end