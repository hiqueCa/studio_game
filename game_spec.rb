require_relative 'game'
require_relative 'die'

describe Game do
    
    before do
        @w00t_life_increase = 15
        @blam_life_decrease = 10
        @initial_healt = 100

        @game = Game.new("Call of Duty")
        @player = Player.new("Randy", @initial_healt)

        @game.add_player(@player)

        @possible_roll_numbers = {"low" => 1, "medium" => 3, "high" => 5}

        $stdout = StringIO.new
    end

    context "can have more than one round" do
        number_of_rounds = 3

        1.upto(number_of_rounds) do |number_of_round|
            it "increases player health by 15 (w00t) if high number (5 or 6) is rolled in die" do
                rolled_number = @possible_roll_numbers["high"]
        
                Die.any_instance.stub(:roll).and_return(rolled_number)
        
                @game.play(number_of_round)
        
                @player.health.should == @initial_healt + (@w00t_life_increase * number_of_round)
            end
        
            it "mantains player health if medium number (3 or 4) is rolled in die" do
                rolled_number = @possible_roll_numbers["medium"]
        
                Die.any_instance.stub(:roll).and_return(rolled_number)
        
                @game.play(number_of_round)
        
                @player.health.should == @initial_healt
            end
        
            it "decreases player health by 10 (blam) if low number (1 or 2) is rolled in die" do
                rolled_number = @possible_roll_numbers["low"]
        
                Die.any_instance.stub(:roll).and_return(rolled_number)
        
                @game.play(number_of_round)
        
                @player.health.should == @initial_healt - (@blam_life_decrease * number_of_round)
            end
        end
    end
end