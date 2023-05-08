# Question 9

# If we have this class:

class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game
  def rules_of_play
    #rules of play
  end
end

# What would happen if we added a play method to the Bingo class, keeping in
# mind that there is already a method of this name in the Game class that the
# Bingo class inherits from.

# The `play` method in the `Bingo` class would override the method inherited
# from the `Game` class, and would be executed when the method is called on any
# instance of the `Bingo` class. Ruby searches within the calling class first
# for the method before looking up the method chain.