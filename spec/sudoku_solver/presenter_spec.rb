require 'sudoku_solver/presenter'

describe SudokuSolver::Presenter do
  it 'should display puzzle when passed a right format array' do
    puzzle = [
      [4, 7, 3, 1, 9, 5, 2, 6, 8],
      [8, 5, 6, 3, 4, 2, 7, 9, 1],
      [9, 2, 1, 6, 8, 7, 5, 3, 4],
      [3, 4, 7, 5, 2, 6, 1, 8, 9],
      [5, 8, 2, 9, 1, 4, 6, 7, 3],
      [6, 1, 9, 8, 7, 3, 4, 5, 2],
      [2, 3, 4, 7, 6, 9, 8, 1, 5],
      [1, 6, 5, 2, 3, 8, 9, 4, 7],
      [7, 9, 8, 4, 5, 1, 3, 2, 6]
    ]

    presenter = SudokuSolver::Presenter.new(puzzle)

    output_str = <<-EOS.gsub(/^ {6}/, '')
      +-----+-----+-----+
      |4 7 3|1 9 5|2 6 8|
      |8 5 6|3 4 2|7 9 1|
      |9 2 1|6 8 7|5 3 4|
      +-----+-----+-----+
      |3 4 7|5 2 6|1 8 9|
      |5 8 2|9 1 4|6 7 3|
      |6 1 9|8 7 3|4 5 2|
      +-----+-----+-----+
      |2 3 4|7 6 9|8 1 5|
      |1 6 5|2 3 8|9 4 7|
      |7 9 8|4 5 1|3 2 6|
      +-----+-----+-----+
    EOS

    expect { presenter.show }.
      to output(output_str).to_stdout
  end
end
