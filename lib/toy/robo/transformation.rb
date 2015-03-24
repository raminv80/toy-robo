module Toy
  module Robo
    class Position2D
      attr_accessor :x, :y 

      def initialize(x, y)
        @x = x
        @y = y
      end

      def move!(direction)
        @x += direction.to_vector[:dx]
        @y += direction.to_vector[:dy]
        self
      end

      def move(direction)
        self.class.new(@x + direction.to_vector[:dx], @y + direction.to_vector[:dy])
      end

      def set(x, y)
        @x, @y = x, y
      end

      def ==(position)
        if position.class == Toy::Robo::Position2D
          @x == position.x && @y == position.y
        elsif position.class == Hash
          @x == position[:x] && @y == position[:y]
        end
      end

      def to_vector
        {x: @x, y: @y}
      end
    end

    class Direction2D
      attr_reader :oriention

      @@definitaion = {
        north: {dx: 0, dy: 1},
        east:  {dx: 1, dy: 0},
        south: {dx: 0, dy: -1},
        west:  {dx:  -1, dy: 0},
      }

      def oriention=(oriention)
        oriention = oriention.downcase.to_sym
        @oriention = oriention if self.class.is_valid?(oriention)
      end

      def initialize(oriention)
        self.oriention = oriention
      end

      def self.is_valid? oriention
        @@definitaion.keys.include? oriention.downcase.to_sym
      end

      def rotate_left
        @oriention = {north: :west, east: :north, south: :east, west: :south}[@oriention]
      end

      def rotate_right
        @oriention = {north: :east, east: :south, south: :west, west: :north}[@oriention]
      end

      def to_vector
        @@definitaion[@oriention]
      end
    end

    class Transformation
      attr_accessor :position, :direction

      def initialize(position, direction)
        @position = position
        @direction = direction
      end

      def move
        @position.move!(@direction)
      end

      def destination
        @position.move(@direction)
      end

      def rotate(oriention)
        @direction.oriention = oriention
      end

      def rotate_left
        @direction.rotate_left
      end

      def rotate_right
        @direction.rotate_right
      end

    end
  end
end