require_relative 'board.rb'
require_relative 'human_player.rb'
require_relative 'computer_player.rb'
class Game
    def initialize(num, players)
        @players = players.map do |mark, playertype|
            playertype ? ComputerPlayer.new(mark) : HumanPlayer.new(mark)
        end 
        @board = Board.new(num)
        @currentplayer = @players.first
    end

    def switch_turn
        @currentplayer = @players.rotate!.first
    end

    def play 
        while @board.empty_positions?
            @board.print
            choices = @board.legal_positions
            pos = @currentplayer.get_position(choices)
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