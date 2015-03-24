module Toy
  module Robo
    class CommandObject
      def initialize(robot, table)
        @robot = robot
        @table = table
      end
    end

    class PlaceCommand < CommandObject
      def validate(args)
        errors = []
        tokens = /(\d+)\s*,\s*(\d+)\s*,\s*([a-zA-Z]+)/.match(args)
        if tokens.nil?
          errors << "[Argument Error] format should be 'PLACE [x:number], [y:number], [oriention]'."
        else
          errors << "[Oriention #{tokens[3]} is not valid] Please use NORTH, WEST, EAST or SOUTH." unless Toy::Robo::Direction2D.is_valid?(tokens[3])
        end

        {errors: errors, tokens: tokens}
      end

      def execute(args)
        validation = validate(args)
        if validation[:errors].empty?
          @robot.place(validation[:tokens][1].to_i, validation[:tokens][2].to_i, validation[:tokens][3]) if @table.allow? Toy::Robo::Position2D.new(validation[:tokens][1].to_i, validation[:tokens][2].to_i)
          nil
        else
          validation[:errors].join(' ')
        end
      end
    end

    class MoveCommand < CommandObject
      def execute(args=nil)
        @robot.move if @table.allow? @robot.transform.destination
        nil
      end
    end

    class LeftCommand < CommandObject
      def execute(args=nil)
        @robot.turn_left
        nil
      end
    end

    class RightCommand < CommandObject
      def execute(args=nil)
        @robot.turn_right
        nil
      end
    end

    class ReportCommand < CommandObject
      def execute(args=nil)
        @robot.report
      end
    end

  end
end