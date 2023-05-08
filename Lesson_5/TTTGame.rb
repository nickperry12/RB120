# TTT Spike

=begin
Tic-tac-toe is a board game that involves two players playing on a 3x3 grid.
Players take turns placing a marker on a square. The first player to mark 3
squares in a row wins. If all squares are marked without satisfying that
condition then the game ends in a tie.

Nouns: Player, Grid, Marker, Square, Board
Verbs: Play, Mark

Board
Square
Player
- play
- mark

=end

class Board
  attr_reader :squares
  INITIAL_MARKER = " "

  def initialize
    @squares = (1..9).each_with_object(Hash.new) do |num, hsh|
      hsh[num] = Square.new(INITIAL_MARKER)
    end
  end

  def get_square_at(key)
    @squares[key]
  end
end

class Square
  attr_reader :marker

  def initialize(marker)
    @marker = marker
  end

  def to_s
    @marker
  end
end

class Player

  def initialize
    # maybe a "marker" to keep track of this player's symbol (ie, 'X' or 'O')
  end

  def mark

  end
end

class TTTGame
  attr_reader :board

  def initialize
    @board = Board.new
  end

  def display_welcome_message
    puts "Welcome to Tic Tac Toe!"
    puts ""
  end

  def display_goodbye_message
    puts "Thank you for playing Tic Tac Toe! Goodbye!"
  end

  def display_board
    puts ""
    puts "     |     |"
    puts "  #{board.get_square_at(1)}  |  #{board.get_square_at(2)}  |  #{board.get_square_at(3)}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{board.get_square_at(4)}  |  #{board.get_square_at(5)}  |  #{board.get_square_at(6)}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{board.get_square_at(7)}  |  #{board.get_square_at(8)}  |  #{board.get_square_at(9)}"
    puts "     |     |"
    puts ""
  end

  def play
    display_welcome_message
    loop do
      display_board
      break
      first_player_moves
      break if someone_won? || board_full?

      second_player_moves
      break if someone_won? || board_full?
    end
    # display_result
    display_goodbye_message
  end
end

game = TTTGame.new
game.play
board = Board.new
p board.squares