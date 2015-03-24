module Toy
	module Robo
		class Robot
      attr_reader :transform

      def initialize(x=0, y=0, f=:north, placed = false)
        position = Toy::Robo::Position2D.new(x, y)
        direction = Toy::Robo::Direction2D.new(f)
        @transform = Toy::Robo::Transformation.new(position, direction)
        @placed = placed
      end

			def place(x, y, oriention)
        @transform.position.set(x, y)
        @transform.direction.oriention = oriention
        @placed = true
			end

      def move
        @transform.move if @placed
      end

      def turn_left
        @transform.rotate_left if @placed
      end

      def turn_right
        @transform.rotate_right if @placed
      end

      def report
        return unless @placed
        x = @transform.position.x
        y = @transform.position.y
        oriention  =@transform.direction.oriention.to_s.upcase
        "Output: #{x},#{y},#{oriention}"
      end

		end


	end
end