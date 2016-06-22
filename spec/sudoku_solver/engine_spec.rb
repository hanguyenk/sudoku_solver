require 'sudoku_solver/engine'

describe SudokuSolver::Engine do
  it 'should return resolved puzzle when passed resolvable puzzle' do
    puzzle = [
      [0, 0, 0, 1, 0, 5, 0, 6, 8],
      [0, 0, 0, 0, 0, 0, 7, 0, 1],
      [9, 0, 1, 0, 0, 0, 0, 3, 0],
      [0, 0, 7, 0, 2, 6, 0, 0, 0],
      [5, 0, 0, 0, 0, 0, 0, 0, 3],
      [0, 0, 0, 8, 7, 0, 4, 0, 0],
      [0, 3, 0, 0, 0, 0, 8, 0, 5],
      [1, 0, 5, 0, 0, 0, 0, 0, 0],
      [7, 9, 0, 4, 0, 1, 0, 0, 0]
    ]

    expect(SudokuSolver::Engine.new(puzzle).run)
      .to eq([
        [4, 7, 3, 1, 9, 5, 2, 6, 8],
        [8, 5, 6, 3, 4, 2, 7, 9, 1],
        [9, 2, 1, 6, 8, 7, 5, 3, 4],
        [3, 4, 7, 5, 2, 6, 1, 8, 9],
        [5, 8, 2, 9, 1, 4, 6, 7, 3],
        [6, 1, 9, 8, 7, 3, 4, 5, 2],
        [2, 3, 4, 7, 6, 9, 8, 1, 5],
        [1, 6, 5, 2, 3, 8, 9, 4, 7],
        [7, 9, 8, 4, 5, 1, 3, 2, 6]
      ])
  end

  it 'should return nil when passed unresolvable puzzle' do
    puzzle = [
      [0, 0, 0, 1, 0, 5, 0, 6, 8],
      [0, 0, 0, 0, 0, 0, 7, 0, 1],
      [9, 0, 1, 0, 0, 0, 0, 3, 0],
      [0, 0, 7, 0, 2, 6, 0, 0, 0],
      [5, 0, 0, 0, 0, 0, 0, 0, 3],
      [0, 0, 0, 8, 7, 0, 4, 0, 0],
      [0, 3, 0, 0, 0, 0, 8, 0, 5],
      [1, 0, 5, 0, 0, 0, 0, 0, 0],
      [7, 9, 0, 4, 0, 9, 0, 0, 0]
    ]

    expect(SudokuSolver::Engine.new(puzzle).run)
      .to eq(nil)
  end
end
