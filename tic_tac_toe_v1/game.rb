require_relative "board.rb"
require_relative "human_player.rb"

class Game
    def initialize(mark1, mark2)
        @player1 = HumanPlayer.new(mark1)
        @player2 = HumanPlayer.new(mark2)
        @current_player = @player1
        @board = Board.new
    end

    def switch_turn
        if @current_player == @player1
            @current_player = @player2
        else
            @current_player = @player1
        end
    end

    def play
        while @board.empty_positions? == true
            @board.print
            pos = @current_player.get_position
            mark = @current_player.mark
            @board.place_mark(pos, mark)
            if @board.win?(mark)
                puts "Victory Player #{mark}, You have Won!!"
                return
            else
                switch_turn
            end
        end
        puts "Game Over! It was a DRAW!!"
    end
end