class House
  attr_reader :price, :address, :rooms

  def initialize(price, address)
    @price = price
    @address = address
    @rooms = []
  end

  def add_room(room)
    @rooms << room
  end

  def rooms_from_category(category)
    @rooms.select {|room| room.category == category}
  end

  def area
    @rooms.inject(0){|sum, room| sum + room.area}
  end

  def price_per_square_foot
    ((@price.delete "$").to_i / self.area.to_f).round(2)
  end

  def rooms_sorted_by_area
    (@rooms.collect{|room| room.area}).sort{|x,y| x<=>y}
  end

  def rooms_by_category
    rooms_hash = Hash.new{|hash, key| hash[key] = []}
    @rooms.map {|room| rooms_hash[room.category] << room}
    rooms_hash
  end
end
