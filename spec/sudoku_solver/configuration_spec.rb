require 'sudoku_solver/configuration'

describe SudokuSolver::Configuration do
  let(:configuration) { SudokuSolver::Configuration.new() }

  context 'the default configuration of' do
    it 'row delimiter is |' do
      expect(configuration.row_delimiter).
        to eq('|')
    end

    it 'hidden place symbol is .' do
      expect(configuration.hidden_place_symbol).
        to eq('.')
    end
  end

  context 'can change configuration of' do
    it 'row delimiter to -' do
      configuration.row_delimiter = '-'

      expect(configuration.row_delimiter).
        to eq('-')
    end

    it 'hidden place symbol is *' do
      configuration.hidden_place_symbol = '*'

      expect(configuration.hidden_place_symbol)
        .to eq('*')
    end
  end
end
