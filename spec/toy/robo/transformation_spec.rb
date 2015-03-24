require 'spec_helper'

describe Toy::Robo do
  subject {Toy::Robo::Transformation.new(Toy::Robo::Position2D.new(2,2), Toy::Robo::Direction2D.new(:north))}

  let(:hashed_position) { {x: 2, y: 2} }

  it 'moves in the specified direction' do

    expect(subject.position).to eq hashed_position
    expect(subject.move).to eq Toy::Robo::Position2D.new(2,3)
    expect(subject.position).to eq Toy::Robo::Position2D.new(2,3)
    
    subject.rotate_left
    expect(subject.move).to eq Toy::Robo::Position2D.new(1,3)
    expect(subject.direction.oriention).to eq :west

    subject.rotate_left
    expect(subject.direction.oriention).to eq :south
    expect(subject.move).to eq Toy::Robo::Position2D.new(1,2)

    subject.rotate_left
    expect(subject.direction.oriention).to eq :east
    expect(subject.move).to eq Toy::Robo::Position2D.new(2,2)
    
    subject.rotate_left
    expect(subject.direction.oriention).to eq :north
    expect(subject.move).to eq Toy::Robo::Position2D.new(2,3)
  end

end
