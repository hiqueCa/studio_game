class Player
    """Class for creating player objects and encapsulate their behavior"""
    attr_reader :health, :name #Same as Getters
    attr_writer :name #Same as Setters

    def initialize(name, initial_healt=100)
        @name = name.capitalize
        @health = initial_healt
    end

    def score
        @health + @name.length
    end

    def format_player_greeting
        "I'm #{@name}."
    end

    def format_player_score
        "My score is #{score}"
    end

    def format_player_health
        "My health is #{@health}."
    end

    def to_s
        format_player_greeting + ' ' + format_player_health + ' ' + format_player_score
    end

    def w00t
        @health += 15
        puts "#{@name} got w00ted!"
    end

    def blam
        @health -= 10
        puts "#{@name} got blammed!"
    end

    #This instance method overwrites the custom name= instance method Ruby defines when attr_writer :name is written inside class scope
    def name=(new_name)
        @name = new_name.capitalize
    end
    
end

"""Some example code to show how the Player class works. 
if _FILE_ == $0 works just the same as if __name__ == 'main' in python, regarding functionality.
Every code that is executed below this conditional is executed only if the scope file is ran directly,
preventing unwanted code to be executed when this file is required inside another main file."""
if __FILE__ == $PROGRAM_NAME
    example_player = Player.new("Henry")
    puts example_player
    example_player.w00t
    example_player.blam
    example_player.name = "Marcus"
    puts example_player
end