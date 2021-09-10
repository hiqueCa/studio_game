require_relative 'clumsy_player'

describe ClumsyPlayer do
    before do
      @player = ClumsyPlayer.new("klutz")
    end
  
    it "only gets half the point value for each treasure" do
        @player.treasure_points.should == 0

        hammer = Treasure.new(:hammer, 50)
        @player.find_treasure(hammer)
        @player.find_treasure(hammer)
        @player.find_treasure(hammer)

        @player.treasure_points.should == 75

        crowbar = Treasure.new(:crowbar, 400)
        @player.find_treasure(crowbar)

        @player.treasure_points.should == 275

        yielded = []
        @player.each_found_treasure do |treasure|
            yielded << treasure
        end

        yielded.should == [Treasure.new(:hammer, 75), Treasure.new(:crowbar, 200)]
    end

    it "is w00ted 10 times" do
        expected_life = @player.health + (10 * 15)

        @player.w00t

        @player.health.should == expected_life
    end
  
  end

