require_relative 'game'
require_relative 'die'

describe Game do
    
    before do
        @initial_healt = 100

        @game = Game.new("Call of Duty")
        @player = Player.new("Randy", @initial_healt)

        @game.add_player(@player)

        @possible_roll_numbers = {"low" => 1, "medium" => 3, "high" => 5}
        $stdout = StringIO.new
    end

    it "increases player health by 15 (w00t) if high number (5 or 6) is rolled in die" do
        rolled_number = @possible_roll_numbers["high"]

        Die.any_instance.stub(:roll).and_return(rolled_number)

        @game.play

        @player.health.should == @initial_healt + 15
    end

    it "mantains player health if medium number (3 or 4) is rolled in die" do
        rolled_number = @possible_roll_numbers["medium"]

        Die.any_instance.stub(:roll).and_return(rolled_number)

        @game.play

        @player.health.should == @initial_healt
    end

    it "decreases player health by 10 (blam) if low number (1 or 2) is rolled in die" do
        rolled_number = @possible_roll_numbers["low"]

        Die.any_instance.stub(:roll).and_return(rolled_number)

        @game.play

        @player.health.should == @initial_healt - 10
    end
end