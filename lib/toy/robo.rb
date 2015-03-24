require "toy/robo/version"
require "toy/robo/robot"
require "toy/robo/table"
require "toy/robo/transformation"
require "toy/robo/commands"
require "toy/robo/invoker"

module Toy
  module Robo
    class Simulator
      def initialize
        @invoker = Toy::Robo::Invoker.new
        @board = Toy::Robo::Table.new(5,5)
        @player = Toy::Robo::Robot.new(0,0)

        #initilizing commands processed by player
        @moveCommand = Toy::Robo::MoveCommand.new(@player, @board)
        @leftCommand = Toy::Robo::LeftCommand.new(@player, @board)
        @rightCommand = Toy::Robo::RightCommand.new(@player, @board)
        @placeCommand = Toy::Robo::PlaceCommand.new(@player, @board)
        @reportCommand = Toy::Robo::ReportCommand.new(@player, @board)
      end

      def execute(command)
        return if command.strip.empty?

        opr, args = command.split(/\s+/)

        case opr.downcase
        when 'move'
          @invoker.store_and_execute(@moveCommand)
        when 'left'
          @invoker.store_and_execute(@leftCommand)
        when 'right'
          @invoker.store_and_execute(@rightCommand)
        when 'place'
          @invoker.store_and_execute(@placeCommand, args)
        when 'report'
          @invoker.store_and_execute(@reportCommand)
        else
          "#{opr} is not a valid command. Available commands are: [MOVE/LEFT/RIGHT/PLACE/REPORT]"
        end
      end

    end

  end
end
