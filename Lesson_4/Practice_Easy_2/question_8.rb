# Question 8

# If we have this class:

class Game
  def play
    "Start the game!"
  end
end

# And this class:

class Bingo
  def rules_of_play
    #rules of play
  end
end

# What can we add to the Bingo class to allow it to inherit the play method from
# the Game class?

# We can make the `Bingo` class inherit from the `Game` class by changing the
# class definition to `class Bingo < Game; end`. The `Bingo` class will then
# have all methods defined within the `Game` class available to it.