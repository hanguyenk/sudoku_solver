require 'sudoku_solver/parser'

describe SudokuSolver::Parser do
  let(:configuration) { SudokuSolver::Configuration.new }

  it 'when passed a default format str should return a correct matrix' do
    str = '...1.5.68|......7.1|9.1....3.|..7.26...|5.......3|...87.4..|.3....8.5|1.5......|79.4.1...'
    parser = SudokuSolver::Parser.new(configuration)
    expect(parser.parse(str)).
      to eq([
        [0, 0, 0, 1, 0, 5, 0, 6, 8],
        [0, 0, 0, 0, 0, 0, 7, 0, 1],
        [9, 0, 1, 0, 0, 0, 0, 3, 0],
        [0, 0, 7, 0, 2, 6, 0, 0, 0],
        [5, 0, 0, 0, 0, 0, 0, 0, 3],
        [0, 0, 0, 8, 7, 0, 4, 0, 0],
        [0, 3, 0, 0, 0, 0, 8, 0, 5],
        [1, 0, 5, 0, 0, 0, 0, 0, 0],
        [7, 9, 0, 4, 0, 1, 0, 0, 0]
      ])
  end

  it 'when passed a right format str of changed configuration should return a correct matrix' do
    str = '***1*5*68|******7*1|9*1****3*|**7*26***|5*******3|***87*4**|*3****8*5|1*5******|79*4*1***'
    new_configuration = SudokuSolver::Configuration.new('|', '*')
    parser = SudokuSolver::Parser.new(new_configuration)
    expect(parser.parse(str)).
      to eq([
        [0, 0, 0, 1, 0, 5, 0, 6, 8],
        [0, 0, 0, 0, 0, 0, 7, 0, 1],
        [9, 0, 1, 0, 0, 0, 0, 3, 0],
        [0, 0, 7, 0, 2, 6, 0, 0, 0],
        [5, 0, 0, 0, 0, 0, 0, 0, 3],
        [0, 0, 0, 8, 7, 0, 4, 0, 0],
        [0, 3, 0, 0, 0, 0, 8, 0, 5],
        [1, 0, 5, 0, 0, 0, 0, 0, 0],
        [7, 9, 0, 4, 0, 1, 0, 0, 0]
      ])
  end
end
