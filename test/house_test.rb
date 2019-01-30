require 'minitest/autorun'
require './lib/room'
require './lib/house'

class HouseTest < Minitest::Test

  def setup
    @house = House.new("$400000", "123 sugar lane")
    @room_1 = Room.new(:bedroom, 10, 13)
    @room_2 = Room.new(:bedroom, 11, 15)
  end

  def test_it_exists

    assert_instance_of House, @house
  end

  def test_attributes

    assert_equal "$400000", @house.price
    assert_equal "123 sugar lane", @house.address
  end

  def test_rooms_is_an_empty_array

    assert_equal [], @house.rooms
  end

  def test_can_add_rooms
    @house.add_room(@room_1)
    @house.add_room(@room_2)

    assert_equal 2, @house.rooms.length
  end
  
end
