module Toy
  module Robo
    class Table
      def initialize(rows, cols)
        @rows = rows
        @cols = cols
      end

      def allow?(position)
        position.x >= 0 && position.x < (@cols) && position.y >= 0 && position.y < (@rows)
      end
    end
  end
end