class Square
  attr_reader :marker
  def initialize(marker)
    @marker = marker
  end
end

hash = {}
(1..9).each { |num| hash[num] = Square.new(' ') }
(1..2).each { |num| hash[num] = Square.new('X') }
hash = hash.transform_values { |val| val.marker }
p hash