require 'pry'

class Board
  WINNING_LINES = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9],
    [1, 4, 7],
    [2, 5, 8],
    [3, 6, 9],
    [1, 5, 9],
    [3, 5, 7]
  ]

  attr_reader :squares

  def initialize
    @squares = {}
    reset
  end

  def get_square_at(key)
    @squares[key]
  end

  def set_square_at(key, marker)
    @squares[key].marker = marker
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked_key? }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!detect_winner
  end

  def detect_winner
    WINNING_LINES.each do |line|
      possible_win_line = @squares.values_at(*line)
      possible_win_line.map!(&:marker)
      return TTTGame::HUMAN_MARKER if possible_win_line.count("X") == 3
      return TTTGame::COMPUTER_MARKER if possible_win_line.count("O") == 3
    end
    nil
  end

  def reset
    @squares = (1..9).each_with_object(Hash.new) do |num, hsh|
      hsh[num] = Square.new
    end
  end
end

class Square
  INITIAL_MARKER = " "

  attr_accessor :marker

  def initialize(marker=INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end

  def unmarked_key?
    marker == INITIAL_MARKER
  end

  def marked_key?
    marker != INITIAL_MARKER
  end
end

class Player
  attr_reader :marker

  def initialize(marker)
    @marker = marker
  end

end

class TTTGame
  HUMAN_MARKER = "X"
  COMPUTER_MARKER = "O"

  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
  end

  def display_welcome_message
    puts "Welcome to Tic Tac Toe!"
    puts ""
  end

  def display_goodbye_message
    puts "Thank you for playing Tic Tac Toe! Goodbye!"
  end

  def display_board
    system 'clear'
    puts "You're a #{human.marker}. The Computer is a #{computer.marker}."
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

  def human_moves
    puts "Please choose a square: #{board.unmarked_keys.join(', ')}"
    square = nil

    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Hmmm, that doesn't appear to be a valid option. Try again."
    end

    board.set_square_at(square, human.marker)
  end

  def computer_moves
    board.set_square_at(board.unmarked_keys.sample, computer.marker)
  end

  def display_result
    display_board
    case board.detect_winner
    when human.marker
      puts "You won! Congratulations!"
    when computer.marker
      puts "The computer won! Better luck next time!"
    else
      puts "It's a tie! Nobody wins!"
    end
  end

  def play_again?
    choice = nil
    puts "That was a great game, very entertaining!"
    puts "Would you like to play again?"
    puts "Please enter either '[y]es' or '[n]o'."

    loop do
      choice = gets.chomp.downcase
      break if ["yes", "y", "no", "n"].include?(choice)
      puts "I'm sorry, that's not a valid option! Try again."
    end

    return true if ["y", "yes"].include?(choice)
    return false if ["n", "no"].include?(choice)
  end

  def play
    display_welcome_message

    in_game = true

    until in_game == false
      display_board

      loop do
        human_moves
        break if board.someone_won? || board.full?

        computer_moves
        break if board.someone_won? || board.full?
        display_board
      end
      display_result
      in_game = false unless play_again?
      board.reset
    end
    display_goodbye_message
  end
end

game = TTTGame.new
game.play
