require 'matrix'

class FieldTrack
  attr_accessor :field, :x_axis, :y_axis

  def initialize(x_axis, y_axis, object = nil)
    @field = Array.new(x_axis).map {|element| element = Array.new(y_axis) }
  end

  def position_of_object(object)
    @field.map.with_index do |elements, index|
      [index,elements.index(object)] unless elements.index(object).nil?
    end.compact.first
  end

  def insert_object_into_position(x, y, object)
    @field[x][y] = object
  end

  def remove_object_from_position(x, y)
    @field[x][y] = nil
  end
end