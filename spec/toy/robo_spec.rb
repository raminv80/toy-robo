require 'spec_helper'

describe Toy::Robo do
  it 'has a version number' do
    expect(Toy::Robo::VERSION).not_to be nil
  end

  describe Toy::Robo::Simulator do
    subject { Toy::Robo::Simulator.new }

    before :each do
      subject.execute('PLACE 0,0,NORTH')
    end

    it "with 'move' command" do
      subject.execute('MOVE')
      expect(subject.execute('REPORT')).to eq("Output: 0,1,NORTH")
    end

    it "with 'left' command" do
      subject.execute('LEFT')
      expect(subject.execute('REPORT')).to eq("Output: 0,0,WEST")
    end

    it "with 'right' command" do
      subject.execute('RIGHT')
      expect(subject.execute('REPORT')).to eq("Output: 0,0,EAST")
    end

    it "with 'place' command" do
      subject.execute('PLACE 1,1,SOUTH')
      expect(subject.execute('REPORT')).to eq("Output: 1,1,SOUTH")
    end
  end
end
