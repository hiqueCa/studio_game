# require_relative is used when the files required are stored inside the same folder as the main file
# requiring game.rb file is enough as player.rb file is required inside game.rb file, so its required automatticaly when requiring game.rb
require_relative 'game'

default_players_file = "players.csv"

knuckleheads = Game.new("Knuckleheads")
knuckleheads.load_players(ARGV.shift || default_players_file)

loop do
    puts "How many game rounds? (enter 'quit' or 'exit' to exit)"
    user_answer = gets.chomp.downcase

    """The same functionality could be achieved with:
    if user_answer.match(/^\d+$/):
        knuckleheads.play(user_answer)
    elsif user_answer == 'quit' || user_answer == 'exit'
        knuckleheads.show_statistics
        break
    else
        puts "'Please, enter a valid number or' 'quit' 'exit'"
    end"""

    case user_answer
    when /^\d+$/
        knuckleheads.play(user_answer.to_i)
    when 'quit', 'exit'
        knuckleheads.show_statistics
        break
    else
        puts "Please, enter a valid number or 'quit' / 'exit'."
    end 
end

knuckleheads.save_high_scores