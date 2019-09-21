require 'rspec_config'

RSpec.describe FieldTrack do
  let!(:field_track) { described_class.new(5,5) }
  let!(:rover) { Rover.new('E') }
 
  context "position control" do
    it "inserting and removing the object" do 
      expect(field_track.insert_object_into_position(1,3,rover)).to eql(rover)
      expect(field_track.field[1][3]).to eq(rover)
      expect(field_track.remove_object_from_position(1,3)).to eql(nil)
      expect(field_track.field[1][3]).to eq(nil)
    end

    it "returns position of object" do
      field_track.insert_object_into_position(4,5,rover)
      expect(field_track.position_of_object(rover)).to eql([4,5])
    end
  end
end