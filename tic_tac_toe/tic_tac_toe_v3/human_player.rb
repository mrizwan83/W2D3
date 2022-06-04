class HumanPlayer
    attr_reader :mark
    def initialize(mark)
        @mark = mark
    end

    def get_position(legal_positions)
        pos = nil
        until legal_positions.include?(pos)
        puts "Player #{mark.to_s}, enter a valid position as row col, two numbers seperated with a space between them"
        pos = gets.chomp.split.map(&:to_i)
        puts "#{pos} is not a legal position" if !legal_positions.include?(pos)
        raise 'please enter a valid position' if pos.length != 2 
        end
        pos
    end
end