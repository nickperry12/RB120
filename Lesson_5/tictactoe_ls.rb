require 'pry'
require 'yaml'
MSG = YAML.load_file('tictactoemsgs.yml')

module Formatable
  def prompt(string)
    puts "=> #{string}"
  end

  def joinor(array, delimiter = ', ', word = 'or ')
    array.map!(&:to_s)
  
    if array.size > 1
      index = 0
      loop do
        array[index] += delimiter
        index += 1
        break if index == array.size - 1
      end
      array.insert(-2, word).join
    else
      array[0]
    end
  end
end

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

  def draw
    puts ""
    puts "     |     |"
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}"
    puts "     |     |"
    puts ""
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
    !!winning_marker
  end

  def winning_marker
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
  include Formatable

  attr_reader :marker, :name, :wins, :losses

  def initialize(marker)
    @marker = marker
    @wins = 0
    @losses = 0
  end

  def increment_wins
    @wins += 1
  end

  def increment_losses
    @losses += 1
  end

  private

  attr_writer :name
end

class Human < Player
  def set_name
    name = nil

    prompt MSG['enter_name']
    loop do
      name = gets.chomp
      if name.gsub(' ', '').nil? || name.gsub(' ', '').empty?
        prompt MSG['invalid_name']
      else
        break
      end
    end
    self.name = name
  end
end

class Computer < Player
  def set_name
    names = ["R2D2", "BD-1", "C3PO", "HAL 9000", "Bender", "RoboCop", "Johnny 5"]
    self.name = names.sample
  end

  def detect_threat(board)
    Board::WINNING_LINES.select do |line|
      board.values_at(*line).map(&:marker).count(TTTGame::HUMAN_MARKER) == 2 &&
        board.values_at(*line).map(&:marker).count(' ') == 1
    end.flatten
  end
  
  def detect_win(board)
    Board::WINNING_LINES.select do |line|
      board.values_at(*line).map(&:marker).count(TTTGame::COMPUTER_MARKER) == 2 &&
        board.values_at(*line).map(&:marker).count(' ') == 1
    end.flatten
  end

  def attack_threat_square(line, board)
    line.select { |square| board[square].marker == Square::INITIAL_MARKER }[0]
  end

  def attack_win_square(line, board)
    line.select { |square| board[square].marker == Square::INITIAL_MARKER }[0]
  end
end

class TTTGame
  include Formatable

  HUMAN_MARKER = "X"
  COMPUTER_MARKER = "O"

  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new
    @human = Human.new(HUMAN_MARKER)
    @computer = Computer.new(COMPUTER_MARKER)
  end

  def clear_screen
    system "clear"
  end

  def display_welcome_message
    prompt MSG['welcome']
    prompt MSG['rules']
  end

  def display_goodbye_message
    prompt MSG['goodbye']
  end

  def display_play_again_message
    prompt MSG['play_again?']
  end

  def clear_screen_display_board
    clear_screen
    display_board
  end

  def display_board
    prompt "#{human.name}'s marker is an X. #{computer.name}'s marker is a #{computer.marker}."
    puts ""
    display_score
    puts ""
    board.draw
  end

  def human_moves
    prompt joinor(board.unmarked_keys, ', ', 'or ')
    square = nil

    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      prompt MSG['invalid_choice']
    end

    board.set_square_at(square, human.marker)
  end

  def computer_moves(brd) 
    threat_line = computer.detect_threat(brd.squares)
    win_line = computer.detect_win(brd.squares)
    if threat_line.empty? && win_line.empty? && brd.squares[5].marker == ' '
      brd.set_square_at(5, computer.marker)
    elsif !win_line.empty?
      brd.set_square_at(computer.attack_win_square(threat_line, brd.squares), computer.marker)
    elsif !threat_line.empty?
      brd.set_square_at(computer.attack_threat_square(threat_line, brd.squares), computer.marker)
    else
      brd.set_square_at(brd.unmarked_keys.sample, computer.marker)
    end

  end

  def display_result
    clear_screen_display_board
    case board.winning_marker
    when human.marker
      prompt MSG['player_wins']
    when computer.marker
      prompt MSG['cpu_wins']
    else
      prompt MSG['tie']
    end
  end

  def update_score
    case board.winning_marker
    when HUMAN_MARKER
      human.increment_wins
      computer.increment_losses
    when COMPUTER_MARKER
      computer.increment_wins
      human.increment_losses
    end
  end

  def display_score
    prompt MSG['current_score']
    puts ""
    prompt "#{human.name}: #{human.wins} wins, #{human.losses} losses."
    prompt "#{computer.name}: #{computer.wins} wins, #{computer.losses} losses."
  end

  def play_again?
    display_play_again_message
    choice = nil

    loop do
      choice = gets.chomp.downcase
      break if ["yes", "y", "no", "n"].include?(choice)
      prompt MSG['invalid_choice']
    end

    return true if ["y", "yes"].include?(choice)
    return false if ["n", "no"].include?(choice)
  end

  def main_game_loop
    in_game = true

    until in_game == false
      display_board

      loop do
        human_moves
        break if board.someone_won? || board.full?
        computer_moves(board)
        break if board.someone_won? || board.full?
        clear_screen_display_board
      end
      display_result
      update_score
      in_game = false unless play_again?
      reset unless in_game == false
    end
  end

  def game_setup
    display_welcome_message
    human.set_name
    computer.set_name
  end

  def play
    game_setup
    main_game_loop
    display_goodbye_message
  end

  def reset
    board.reset
    clear_screen
  end
end

game = TTTGame.new
game.play
