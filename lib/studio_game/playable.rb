module HenrisStudioGame
    module Playable
        """Module for encapsulating playable specific methods as instance methods that can be shared
        across classes and other modules that don't relate to each other through the 'is-a' relation."""

        def w00t
            @health += 15
            puts "#{name} got w00ted!"
        end

        def blam
            @health -= 10
            puts "#{name} got blammed!"
        end

        def strong?
            """Same as:
            if @health > 100
                true
            else
                false
            end """
            health > 100
        end
    end
end