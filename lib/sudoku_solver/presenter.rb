module SudokuSolver
  class Presenter
    def initialize(matrix)
      @matrix = matrix
    end

    def show
      border = "+-----+-----+-----+"
      9.times do |i|
        puts border if i%3 == 0
        9.times do |j|
          print j%3 == 0 ? "|" : " "
          print @matrix[i][j] == 0 ? "." : @matrix[i][j]
        end
        puts "|"
      end
      puts border
    end
  end
end
