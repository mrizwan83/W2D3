require_relative 'board.rb'
require_relative 'human_player.rb'

class Game
    def initialize(num, *marks)
        @players = marks.map { |mark| HumanPlayer.new(mark) }
        @board = Board.new(num)
        @currentplayer = @players.first
    end

    def switch_turn
        @currentplayer = @players.rotate!.first
    end

    def play 
        while @board.empty_positions?
            @board.print
            pos = @currentplayer.get_position
            @board.place_mark(pos, @currentplayer.mark)
            if @board.win?(@currentplayer.mark)
                return "victory player #{@currentplayer.mark}"
            else
                self.switch_turn
            end
        end
        return "there was a draw, no winner!"
    end
end