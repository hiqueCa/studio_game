require_relative 'player'
require_relative 'players_life_changer'
"""File for testing Player class specs using RSpec"""

describe Player do
    
    before do
        #Instance variables used through the testing code below
        #They might changhe as needed, using contexts when defining the tests
        @initial_healt = 80
        @player = Player.new("gabi", @initial_healt)
        @found_treasure = Treasure.new(:hammer, 50)
        #Setting the global variable $stdout to a new StringIO object that only stores the I/O results, not showing them on screen
        $stdout = StringIO.new
    end

    it "Has a capitalized name if name has only lowercase letters" do
        @player.name.should == "Gabi"
    end

    it "Has a capitalized name if name has only uppercase letters" do
        player = Player.new("GABI", 80)
        player.name.should == "Gabi"    
    end

    it "Has a capitalized name if name has mixed upper and lowercase letters" do
        player = Player.new("gABi")
        player.name.should == "Gabi"
    end

    it "Has a initial health" do
        @player.health.should == 80
    end

    it "Has a formatted readable string representation if initial health passed as parameter" do
        @player.to_s.should == "I'm Gabi. My health is 80. My score is #{@player.score}"
    end

    it "Has a formatted readable string representation if initial health not passed as parameter" do
        player_2 = Player.new("Gabi")
        player_2.to_s.should == "I'm Gabi. My health is 100. My score is #{player_2.score}"
    end

    it "Computes it's score as the sum of it's health and treasure points" do
        @player.find_treasure(@found_treasure)
        @player.score.should == @player.health + @found_treasure.points
    end

    context "Expected healths created for testing w00t and blam methods" do
        before do
            @player_1 = Player.new("Genny", 90)
            @expected_health_after_w00t = 105
            @expected_health_after_blam = 80
        end

        it "Increases health by 15 when w00ted" do
            @player_1.w00t
            @player_1.health.should == @expected_health_after_w00t
        end
    
        it "Decreases health by 10 when blammed" do
            @player_1.blam 
            @player_1.health.should == @expected_health_after_blam
        end
    end

    context "with predefined initial health of 150" do
        before do
            @player = Player.new("random", 150)
        end

        it "Is a strong player" do
            @player.should be_strong
            #Same as doing: @player.strong?.should == true or @player.strong?.should be_true
        end
    end

    context "with a predefined initial health of 100" do 
        before do
            @player = Player.new("Wally", 100)
        end

        it "is a wimpy player" do
            @player.should_not be_strong
            #Same as doing: @player.strong?.should == false or @player.strong?.should_not be_true
        end
    end
end