class RoversControl
  attr_accessor :rovers, :field

  def initialize(field, rovers)
    @field = field
    @rovers = rovers
  end

  def move_rover(rover_index,command_string)
    rover = rovers[rover_index]
      command_string.split("").each do |command|
        input_command_on_rover(rover, command)
      end
      update_position(rover)
      rover.erase_track_history
      @field.position_of_object(rover).push(rover.face_side)
  end

  def move_all_rovers(commands)
    rovers.each.with_index do |rover,index|
      move_rover(index, commands[index])
    end
    true
  end

  def position_check(rover)
    @field.position_of_object(rover)
  end

  def check_rover_facing(rover_index)
    @rovers[rover_index].face_side
  end

  private
  
  def input_command_on_rover(rover, command)
    rover.face_left and return if command.eql?("L")
    input_command_right_on_rover(rover, command)
  end

  def input_command_right_on_rover(rover, command)
    rover.face_right and return if command.eql?("R")
    input_command_move_on_rover(rover, command)
  end

  def input_command_move_on_rover(rover, command)
    rover.move and return if command.eql?("M")
  end 

  def update_position(rover)
    x_old, y_old = rover.initial_position.first, rover.initial_position.last
    x_next, y_next =  x_old, y_old
    rover_facing = ""

    rover.track_history.each do |track|
      if track.eql?("M") 
        x_next = x_update(x_old,rover_facing) || x_next
        y_next = y_update(y_old,rover_facing) || y_next
        @field.insert_object_into_position(x_next, y_next, rover)
        @field.remove_object_from_position(x_old, y_old)
        x_old = x_next
        y_old = y_next
      else
        rover_facing = track
      end
    end
  end

  def x_update(x_old, rover_facing)
    return x_old + 1 if rover_facing.eql?("E") 
    return x_old - 1 if rover_facing.eql?("W") 
  end

  def y_update(y_old, rover_facing)
    return y_old + 1 if rover_facing.eql?("N") 
    return y_old - 1 if rover_facing.eql?("S") 
  end
end