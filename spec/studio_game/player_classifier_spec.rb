require 'studio_game/player_classifier'
require 'studio_game/game'

module HenrisStudioGame
    describe PlayersClassifier do
        context "includes three players in a array" do
            before do
                @random_array = []
                @player_1 = Player.new("Larry", 180)
                @player_2 = Player.new("Mile", 100)
                @player_3 = Player.new("Jerry", 80)
                @players_array = [@player_1, @player_2, @player_3]
            end

            it "classifies the players correctly" do
                PlayersClassifier.show_classified_players_high_scores(@players_array).should == [@player_1, @player_2, @player_3]
            end
        end
    end
end
