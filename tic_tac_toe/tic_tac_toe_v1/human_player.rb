class HumanPlayer
    attr_reader :mark

    def initialize(mark)
        @mark = mark
    end

    def get_position
        puts "Player #{mark.to_s}, please enter your next position as 'row column' 'first number for row, followed by space, and second number for column'"
        pos = gets.chomp.split.map(&:to_i)
        raise "That was invalid, please enter a valid position via the valid format" if pos.length != 2
        pos
    end
end