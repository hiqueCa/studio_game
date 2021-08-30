require_relative 'player'

class Game 
    """Class for managing game state and methods in general"""
    attr_reader :title

    def initialize(title)
        @title = title
        @players = Array.new #Explicit way of creating new arry in Ruby == @players = []
    end

    def add_player(player)
        @players.push(player) #Same as doing @players << player
    end

    def play 
        puts @players

        @players.each do |player|
            player.w00t
            player.w00t
            player.blam
            puts player
        end
    end
end