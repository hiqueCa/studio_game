# require_relative is used when the files required are stored inside the same folder as the main file
require_relative 'game'

player_1 = Player.new("larry")
player_2 = Player.new("moe", 60)
player_3 = Player.new("curly", 125)

knuckleheads = Game.new("Knuckleheads")
knuckleheads.add_player(player_1)
knuckleheads.add_player(player_2)
knuckleheads.add_player(player_3)
knuckleheads.play