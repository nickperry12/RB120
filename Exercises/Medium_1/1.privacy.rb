# Privacy

# Consider the following class:

class Machine
  def start
    self.flip_switch(:on)
  end

  def stop
    self.flip_switch(:off)
  end

  def switch_on_or_off?
    puts switch
  end

  private

  attr_accessor :switch

  def flip_switch(desired_state)
    self.switch = desired_state
  end
end

machine = Machine.new
machine.start
machine.switch_on_or_off?
machine.stop
machine.switch_on_or_off?

# Modify this class so both flip_switch and the setter method switch= are
# private methods.