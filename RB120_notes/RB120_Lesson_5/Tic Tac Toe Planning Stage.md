
Need to write a short description of the game:

```
Tic-tac-toe is a board game that involves two players playing on a 3x3 grid. Players take turns placing a marker on a square. The first player to mark 3 squares in a row wins. If all squares are marked without satisfying that condition then the game ends in a tie.
```

From here, we can extract the nouns and verbs that might be useful

```
Nouns: Player, Grid, Marker, Square, Board
Verbs: Play, Mark
```

We can now organize the verbs with their respective nouns

```
Board
Square
Player
- play
- mark
```

Grid is excluded because it refers to the same thing as board. We can also exclude 'Marker' as we have the verb 'mark' which refers to marking a square.

There doesn't appear to be any verbs for "Board" or "Square", making the organization of verbs and nouns seem really awkward. Recall that we ran into a similar thing when first starting out the Rock, Paper, Scissors program.

Remember, though, that this exercise only serves as a starting point for us to "spike", or explore.

### Spike

We can start to write out our classes. We can create an ` initialize ` method for the classes and start to think about possible states for the objects of the class

```ruby
class Board
  def initialize
    # we need some way to model the 3x3 grid. Maybe "squares"?
    # what data structure should we use?
    # - array/hash of Square objects?
    # - array/hash of strings or integers?
  end
end

class Square
  def initialize
    # maybe a "status" to keep track of this square's mark?
  end
end

class Player
  def initialize
    # maybe a "marker" to keep track of this player's symbol (ie, 'X' or 'O')
  end

  def mark

  end

  def play

  end
end
```

There are still lots of questions about where responsibilities lie, and how to cleanly organize all of the behaviors. 
- Might not even needed all the classes above.
	- For example, do we need a ` Square ` or ` Player ` class yet?

We need to explore the problem to get a better feel for the code. 

One class we do need is some sort of orchestration engine. 

```ruby
class TTTGame
	def play

	end
end

game = TTTGame.new
game.play
```

Given the above, we can remove the ` Player#play ` instance method. Let's try to flesh out the sequence of the ` TTTGame#Play ` method by invoking methods that we think should exist.

```ruby
class TTTGame
	def play
		display_welcome_message
		loop do
			display_board
			first_player_moves
			break if someone_won? || board_full?

			second_player_moves
			break if someone_won? || board_full?
		end
		display_result
		display_goodbye_message
	end
end
```

The above methods, if they existed and did what we expect, constitute the major steps of the Tic Tac Toe game. We have enough scaffolding code now to start exploring deeper.