class Room
  attr_reader :category, :width, :length

  def initialize(category, length, width)
    @category = category
    @length = length
    @width = width
  end

  def area
    @length * @width
  end
end
