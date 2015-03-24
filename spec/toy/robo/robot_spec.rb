require 'spec_helper'

describe Toy::Robo do
  subject {Toy::Robo::Robot.new(2, 2, :north, true)}

  let(:hashed_position) { {x: 2, y: 2} }

  describe '#place' do
    it 'validates existance of a position on its surface' do
      subject.place(1,1,:south)
      expect(subject.report).to eq("Output: 1,1,SOUTH")
    end
  end

  describe '#move' do
    it 'validates existance of a position on its surface' do
      subject.move
      expect(subject.report).to eq("Output: 2,3,NORTH")
    end
  end

  describe 'turn left' do
    it 'validates existance of a position on its surface' do
      subject.turn_left
      expect(subject.report).to eq("Output: 2,2,WEST")
    end
  end

  describe 'turn right' do
    it 'validates existance of a position on its surface' do
      subject.turn_right
      expect(subject.report).to eq("Output: 2,2,EAST")
    end
  end
  
end
