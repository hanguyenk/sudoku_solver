require_relative 'sudoku_solver/configuration'
require_relative 'sudoku_solver/engine'
require_relative 'sudoku_solver/parser'
require_relative 'sudoku_solver/presenter'

module SudokuSolver
  def self.run(str)
    configuration = SudokuSolver::Configuration.new
    puzzle = SudokuSolver::Parser.new(configuration).parse(str)
    result = SudokuSolver::Engine.new(puzzle).run

    if result.nil?
      puts 'The inputted puzzle could not be resolved.'
    else
      SudokuSolver::Presenter.new(result).show
    end
  end
end
