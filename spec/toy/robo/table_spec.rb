require 'spec_helper'

describe Toy::Robo do
  subject { Toy::Robo::Table.new(5,5) }

  let(:hashed_position) { {x: 2, y: 2} }

  describe '#allow?' do
    let(:valid_position) { Toy::Robo::Position2D.new(2,2) }
    let(:invalid_position) { Toy::Robo::Position2D.new(6,2) }

    it 'validates existance of a position on its surface' do
      expect(subject.allow?(valid_position)).to be(true)
      expect(subject.allow?(invalid_position)).to be(false)
    end
  end
  
end
