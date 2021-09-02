class Die
    """Class for managing Die class states and behaviors"""
    attr_reader :number

    def initialize
        roll
    end

    def roll
        @number = rand(1..6)
    end
end
