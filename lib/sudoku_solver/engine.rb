# Solution from: https://rosettacode.org/wiki/Sudoku#Ruby
# Using back-tracking algorithm: https://en.wikipedia.org/wiki/Sudoku_solving_algorithms
module SudokuSolver
  class Engine
    def initialize(matrix)
      @matrix = matrix
    end

    def run
      solve_sudoku(@matrix)
    end

    private

      def permissible(matrix, i, j)
        ok = [nil, *1..9]
        check = ->(x,y) { ok[matrix[x][y]] = nil  if matrix[x][y].nonzero? }
        # Same as another in the column isn't permissible...
        9.times { |x| check[x, j] }
        # Same as another in the row isn't permissible...
        9.times { |y| check[i, y] }
        # Same as another in the 3x3 block isn't permissible...
        xary = [ *(x = (i / 3) * 3) .. x + 2 ]        #=> [0,1,2], [3,4,5] or [6,7,8]
        yary = [ *(y = (j / 3) * 3) .. y + 2 ]
        xary.product(yary).each { |x, y| check[x, y] }
        # Gathering only permitted one
        ok.compact
      end

      def deep_copy_sudoku(matrix)
        matrix.collect { |row| row.dup }
      end

      def solve_sudoku(matrix)
        loop do
          options = []
          9.times do |i|
            9.times do |j|
              next if matrix[i][j].nonzero?
              p = permissible(matrix, i, j)
              # If nothing is permissible, there is no solution at this level.
              return if p.empty?              # return nil
              options << [i, j, p]
            end
          end
          # If the matrix is complete, we have a solution...
          return matrix if options.empty?

          i, j, permissible = options.min_by { |x| x.last.length }

          # If there is an option with only one solution, set it and re-check permissibility
          if permissible.length == 1
            matrix[i][j] = permissible[0]
            next
          end

          # We have two or more choices. We need to search both...
          permissible.each do |v|
            mtmp = deep_copy_sudoku(matrix)
            mtmp[i][j] = v
            ret = solve_sudoku(mtmp)
            return ret if ret
          end

          # We did an exhaustive search on this branch and nothing worked out.
          return
        end
      end
  end
end
