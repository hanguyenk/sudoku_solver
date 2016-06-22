module SudokuSolver
  class Parser
    attr_reader :configuration

    def initialize(configuration)
      @configuration = configuration
    end

    def parse(str)
      validate_str!(str)

      rows = str.split(configuration.row_delimiter)
      9.times.collect { |i| 9.times.collect { |j| rows[i][j].to_i } }
    end

    protected

      def puzzle_format
        @puzzle_format ||= Regexp.new "(([1-9]|\\#{@configuration.hidden_place_symbol}){9}\\#{@configuration.row_delimiter}){8}([1-9]|\\#{@configuration.hidden_place_symbol}){9}"
      end

    private

      def validate_str!(str)
        raise StandardError.new('Empty string passed') if str == ''

        unless str =~ puzzle_format
          raise StandardError.new('Wrong format puzzle passed')
        end
      end
  end
end
