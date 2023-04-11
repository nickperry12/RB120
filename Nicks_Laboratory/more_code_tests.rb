class Aircraft
  attr_accessor :type, :year

  def initialize(t, y)
    @type = t
    @year = y
  end
end

jet = Aircraft.new('Jet', 2002)
p jet.year