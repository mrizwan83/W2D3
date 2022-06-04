class Board
    def initialize(n)
        @grid = Array.new(n) { Array.new(n, '_')}
    end

    def [](pos)
        row, col = pos
        @grid[row][col]
    end

    def []=(pos, mark)
        row, col = pos
        @grid[row][col] = mark
    end

    def valid?(pos)
        row, col = pos
        pos.all? { |i| 0 <= i && i < @grid.length }
    end
    
    def empty?(pos)
        self[pos] == '_'
    end

    def place_mark(pos, mark)
        raise 'not valid positon' if !valid?(pos) || !empty?(pos)
        self[pos] = mark
    end

    def print
        @grid.each do |row|
            puts row.join(" ")
        end
    end

    def win_row?(mark)
        @grid.any? { |row| row.count(mark) == @grid.length}
    end

    def win_col?(mark)
        @grid.transpose.any? { |row| row.count(mark) == @grid.length}
    end

    def win_diagonal?(mark)
        ltor = (0...@grid.length).all? { |i| @grid[i][i] == mark }
        rtol = (0...@grid.length).all? { |i| @grid[i][-1 - i] == mark }
        ltor || rtol 
    end

    def win?(mark)
        win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
    end

    def empty_positions?
        @grid.flatten.any? { |ele| ele == '_'}
    end

    def legal_positions
        ans = []
        @grid.each_with_index do |row, i1|
            row.each_with_index do |ele, i2|
                ans << [i1, i2] if ele == '_'
            end
        end
        ans
    end
    
end