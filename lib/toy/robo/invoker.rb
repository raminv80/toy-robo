module Toy
  module Robo
    class Invoker
      attr_reader :commands

      def initialize
        @commands = []
      end

      def store_and_execute(command, args = nil)
        @commands << command
        command.execute args
      end
    end
  end
end