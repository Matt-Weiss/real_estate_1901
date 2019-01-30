require 'minitest/autorun'
require './lib/room'
require './lib/house'

class HouseTest < Minitest::Test

  def setup
    @house = House.new("$400000", "123 sugar lane")
    @room_1 = Room.new(:bedroom, 10, 13)
    @room_2 = Room.new(:bedroom, 11, 15)
    @room_3 = Room.new(:living_room, 25, 15)
    @room_4 = Room.new(:basement, 30, 41)
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

  def test_rooms_can_sort_by_category
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    @house.add_room(@room_3)
    @house.add_room(@room_4)

    assert_equal 2, @house.rooms_from_category(:bedroom).length
    assert_equal 1, @house.rooms_from_category(:basement).length
  end

  def test_house_area
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    @house.add_room(@room_3)
    @house.add_room(@room_4)

    assert_equal 1900, @house.area
  end
end
