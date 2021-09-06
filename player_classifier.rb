require_relative 'player'
require_relative 'game'

module PlayersClassifier
    def self.show_players_statistics(players)
        # puts "#{strongs.length} strong player(s):"
        # strongs.each {|player| puts "#{player.name} (#{player.health})"}

        # puts"#{wimpys.length} wimpy player(s):"
        # wimpys.each {|player| puts ""}
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
            player_formatted_string = "#{player.name}".ljust(10, '.') + "#{player.score}"
            
            puts player_formatted_string
        end
    end
end