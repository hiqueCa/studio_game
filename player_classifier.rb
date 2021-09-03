module PlayersStatisticsOutputer
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
end