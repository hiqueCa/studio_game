module HenrisStudioGame
    module Auditable

        def audit
            puts "Rolled a #{@number} (#{self.class})"
        end
    end
end