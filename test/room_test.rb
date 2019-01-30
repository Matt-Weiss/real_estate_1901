require './lib/room'
require 'minitest/autorun'

class RoomTest < Minitest::Test

  def setup
    @room = Room.new(:bedroom, 10, 13)
  end


  def test_it_exists

    assert_instance_of Room, @room
  end

  def test_attributes

    assert_equal 10, @room.length
    assert_equal :bedroom, @room.category
    assert_equal 13, @room.width
  end

  def test_area_calculation

    assert_equal 130, @room.area
  end
  
end
