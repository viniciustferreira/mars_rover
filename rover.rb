class Rover
  attr_accessor :face_side, :index_cardinal, :track, :initial_position
  CARDINALS = ['N','E','S','W']

  def initialize(face_side,initial_position = nil)
    @face_side = face_side
    @index_cardinal = CARDINALS.index(face_side)
    @initial_position = initial_position
    @track = [CARDINALS[@index_cardinal]]
  end

  def face_left
    index = @index_cardinal - 1 < 0 ? 3 : @index_cardinal - 1
    @index_cardinal = index
    @track << CARDINALS[index]
    @face_side = CARDINALS[index]
  end

  def face_right
    index = @index_cardinal + 1 > 3 ? 0 : @index_cardinal + 1
    @index_cardinal = index
    @track << CARDINALS[index]
    @face_side = CARDINALS[index]
  end

  def move
    @track << "M"
  end

  def track_history
    @track
  end

  def erase_track_history
    @track = [CARDINALS[@index_cardinal]]
  end
end