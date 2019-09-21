require 'rspec_config'

RSpec.describe Rover do

  context "moving" do
    it "changes facing to left" do
     rover = Rover.new('E',[1,2])
     expect(rover.face_left).to eq('N') 
    end

    it "changes facing to right" do
     rover = Rover.new('E')
     expect(rover.face_right).to eq('S') 
    end

    it "starting face north and moves to south" do
     rover = Rover.new('N')
     rover.face_right
     expect(rover.face_side).to eq('E') 
     rover.face_right
     expect(rover.face_side).to eq('S') 
     rover.move
     expect(rover.track_history).to eq(['N','E','S','M']) 
    end

    it "erases the history" do
     rover = Rover.new('E',[1,2])
     rover.face_right
     rover.move
     expect(rover.track_history).to eq(['E','S','M']) 
     expect(rover.erase_track_history).to eq(['S']) 
    end
  end
end