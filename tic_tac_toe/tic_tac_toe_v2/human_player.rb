class HumanPlayer
    attr_reader :mark
    def initialize(mark)
        @mark = mark
    end

    def get_position
        puts "enter a valid position as two numbers seperated with a space between them"
        pos = gets.chomp.split.map(&:to_i)
        raise 'please enter a valid position' if pos.length != 2
        pos
    end
end