class Board
    def initialize
        @grid = Array.new(3) {Array.new(3, "_")}
    end

    def [](pos)
        row, col = pos
        @grid[row][col] 
    end

    def []=(pos, val)
        row, col = pos
        @grid[row][col] = val
    end

    def valid?(pos)
        row, col = pos
        pos.all? do |i|
            0 <= i && i < @grid.length
        end
    end

    def empty?(pos)
        self[pos] == "_"
    end

    def place_mark(pos, mark)
        raise 'invalid position' if !valid?(pos) || !empty?(pos)
        self[pos] = mark
    end

    def print
        @grid.each do |row|
            puts row.join(" ")
        end
    end

    def win_row?(mark)
        @grid.any? { |row| row.all?(mark)}
    end

    def win_col?(mark)
        @grid.transpose.any? { |col| col.all?(mark)}
    end

    def win_diagonal?(mark)
        ltor = (0...@grid.length).all? do |i|
            pos = [i, i]
            self[pos] == mark
        end
        rtol = (0...@grid.length).all? do |i|
            row = i
            col = @grid.length - 1 - i
            pos = [row, col]
            self[pos] == mark
        end
        ltor || rtol
    end

    def win?(mark)
        win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
    end

    def empty_positions?
        (0...@grid.length).each do |i1|
            (0...@grid.length).each do |i2|
                pos = [i1, i2]
                if empty?(pos)
                    return true
                else
                    return false
                end
            end
        end
    end
end