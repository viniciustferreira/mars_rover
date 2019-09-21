require 'rspec_config'

#pos origin 1 2 N
#pos origin 3 3 E
#instructions LMLMLMLMM
#instruction MMRMMRMRRM
RSpec.describe RoversControl do
  let!(:rover1) { Rover.new("N",[1,2]) }
  let!(:rover2) { Rover.new("E",[3,3]) }
  let!(:rovers_control) { described_class.new(FieldTrack.new(6,6),[rover1, rover2]) }

  context "moving rovers by control" do
    it "moving the position of the rovers" do 
      expect(rovers_control.move_rover(0,'LMLMLMLMM')).to eq([1, 3, "N"])
      expect(rovers_control.move_rover(1,'MMRMMRMRRM')).to eq([5, 1, "E"])
      expect(rovers_control.position_check(rover1)).to eq([1,3])
      expect(rovers_control.position_check(rover2)).to eq([5,1])
      expect(rovers_control.check_rover_facing(0)).to eq('N')
      expect(rovers_control.check_rover_facing(1)).to eq('E')
    end

    it "moves all rovers" do
      expect(rovers_control.move_all_rovers(['LMLMLMLMM','MMRMMRMRRM'])).to eq(true)
      expect(rovers_control.position_check(rover1)).to eq([1,3])
      expect(rovers_control.position_check(rover2)).to eq([5,1])
      expect(rovers_control.check_rover_facing(0)).to eq('N')
      expect(rovers_control.check_rover_facing(1)).to eq('E')
    end
  end
end