require 'spec_helper'

describe Toy::Robo do
  subject { Toy::Robo::Invoker.new }

  describe '#store_and_execute' do
    let!(:player) { Toy::Robo::Robot.new(2, 2, :north, true) }
    let!(:board) { Toy::Robo::Table.new(5,5) }
    let!(:report_command) { Toy::Robo::ReportCommand.new(player, board) }

    it 'stores the command and executes it' do
      expect(subject.store_and_execute(report_command)).to eq("Output: 2,2,NORTH")
      expect(subject.commands.length).to eq(1)
    end
  end
end