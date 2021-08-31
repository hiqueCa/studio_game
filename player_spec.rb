require_relative 'player'

describe Player do
    
    before do
        @initial_healt = 80
        @player = Player.new("gabi", @initial_healt)
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
        player = Player.new("Gabi", 80)
        player.health.should == 80
    end

    it "Has a formatted readable string representation if initial health passed as parameter" do
        player = Player.new("Gabi", 65)
        player.to_s.should == "I'm Gabi. My health is 65. My score is #{player.score}"
    end

    it "Has a formatted readable string representation if initial health not passed as parameter" do
        player = Player.new("Gabi")
        player.to_s.should == "I'm Gabi. My health is 100. My score is #{player.score}"
    end

    it "Computes it's score as the sum of it's health and name length"
    it "Increases health by 15 when w00ted"
    it "Decreases health by 10 when blammed"
end