# require_relative is used when the files required are stored inside the same folder as the main file
# requiring game.rb file is enough as player.rb file is required inside game.rb file, so its required automatticaly when requiring game.rb
require_relative 'game'

player_1 = Player.new("larry")
player_3 = Player.new("curly", 125)

knuckleheads = Game.new("Knuckleheads")
knuckleheads.add_player(player_1)
knuckleheads.add_player(player_2)
knuckleheads.add_player(player_3)
knuckleheads.play