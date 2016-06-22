module SudokuSolver
  class Configuration
    attr_accessor :row_delimiter, :hidden_place_symbol

    def initialize(row_delimiter = '|', hidden_place_symbol = '.')
      @row_delimiter = row_delimiter
      @hidden_place_symbol = hidden_place_symbol
    end
  end
end
