require 'spec_helper'

describe Toy::Robo do

  let!(:player) { Toy::Robo::Robot.new(2, 2, :north, true) }
  let!(:board) { Toy::Robo::Table.new(5, 5) }

  describe '#PlaceCommand' do
    subject { Toy::Robo::PlaceCommand.new(player, board) }

    it 'places player on board at desired position' do
      expect(subject.execute("1,3,WEST")).to be_nil
      expect(player.report).to eq("Output: 1,3,WEST")
    end

    it 'reports argument errors' do
      expect(subject.execute("")).to eq("[Argument Error] format should be 'PLACE [x:number], [y:number], [oriention]'.")
      expect(subject.execute("1,2")).to eq("[Argument Error] format should be 'PLACE [x:number], [y:number], [oriention]'.")
      expect(subject.execute("1,2,unknown")).to eq("[Oriention unknown is not valid] Please use NORTH, WEST, EAST or SOUTH.")
      expect(player.report).to eq("Output: 2,2,NORTH")
    end
  end

  describe '#MoveCommand' do
    subject { Toy::Robo::MoveCommand.new(player, board) }

    it 'moves player ahead' do
      expect(subject.execute).to be_nil
      expect(player.report).to eq("Output: 2,3,NORTH")
    end
  end

  describe '#LeftCommand' do
    subject { Toy::Robo::LeftCommand.new(player, board) }

    it 'turns player left' do
      expect(subject.execute).to be_nil
      expect(player.report).to eq("Output: 2,2,WEST")
    end
  end

  describe '#RightCommand' do
    subject { Toy::Robo::RightCommand.new(player, board) }

    it 'turns player right' do
      expect(subject.execute).to be_nil
      expect(player.report).to eq("Output: 2,2,EAST")
    end
  end

  describe '#ReportCommand' do
    subject { Toy::Robo::ReportCommand.new(player, board) }

    it 'reports back position of player' do
      expect(subject.execute).to eq("Output: 2,2,NORTH")
    end
  end

end
