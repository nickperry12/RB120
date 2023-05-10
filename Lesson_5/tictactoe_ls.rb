require 'yaml'
MSG = YAML.load_file('tictactoemsgs.yml')

module Formatable
  def prompt(string)
    puts "=> #{string}"
  end

  def joinor(array, delimiter = ', ', word = 'or ')
    array.map!(&:to_s)

    if array.size > 1
      array[0..-2].join(delimiter) + ' ' + word + array[-1]
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

  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength
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
  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/MethodLength

  def []=(key, marker)
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
      return TTTGame::CPU_MARKER if possible_win_line.count("O") == 3
    end
    nil
  end

  def reset!
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
      break unless name.gsub(' ', '').nil? || name.gsub(' ', '').empty?
      prompt MSG['invalid_name']
    end
    self.name = name
  end
end

class Computer < Player
  def set_name
    list = ["R2D2", "BD-1", "C3PO", "HAL 9000", "Bender", "RoboCop", "Johnny 5"]
    self.name = list.sample
  end

  def detect_threat(board)
    Board::WINNING_LINES.select do |line|
      board.values_at(*line).map(&:marker).count(TTTGame::HUMAN_MARKER) == 2 &&
        board.values_at(*line).map(&:marker).count(' ') == 1
    end.flatten
  end

  def detect_win(board)
    Board::WINNING_LINES.select do |line|
      board.values_at(*line).map(&:marker).count(TTTGame::CPU_MARKER) == 2 &&
        board.values_at(*line).map(&:marker).count(' ') == 1
    end.flatten
  end

  def get_threat_square(line, board)
    line.select { |square| board[square].marker == Square::INITIAL_MARKER }[0]
  end

  def get_win_square(line, board)
    line.select { |square| board[square].marker == Square::INITIAL_MARKER }[0]
  end
end

class TTTGame
  include Formatable

  HUMAN_MARKER = "X"
  CPU_MARKER = "O"

  attr_reader :board, :human, :cpu, :current_player

  def initialize
    @board = Board.new
    @human = Human.new(HUMAN_MARKER)
    @cpu = Computer.new(CPU_MARKER)
    @current_player = [HUMAN_MARKER, CPU_MARKER].sample
  end

  def play
    game_setup
    game_loading
    main_game_loop
    display_goodbye_message
  end

  private

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
    prompt "#{human.name}'s marker is an X."
    prompt "#{cpu.name}'s marker is a #{cpu.marker}."
    puts ""
    display_score
    puts ""
    board.draw
  end

  def display_result
    clear_screen_display_board
    case board.winning_marker
    when human.marker
      prompt MSG['player_wins']
    when cpu.marker
      prompt MSG['cpu_wins']
    else
      prompt MSG['tie']
    end
  end

  def display_score
    prompt MSG['current_score']
    puts ""
    prompt "#{human.name}: #{human.wins} wins, #{human.losses} losses."
    prompt "#{cpu.name}: #{cpu.wins} wins, #{cpu.losses} losses."
  end

  def confirm_play_again_message
    prompt MSG['another_one']
    state_first_player
    prompt MSG['loading']
    sleep(5)
  end

  def state_first_player
    puts ""
    prompt MSG['first_move'] + human.name if human_turn?
    prompt MSG['first_move'] + cpu.name if cpu_turn?
  end

  def human_turn?
    current_player == HUMAN_MARKER
  end

  def human_moves!
    prompt joinor(board.unmarked_keys, ', ', 'or ')
    square = nil

    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      prompt MSG['invalid_choice']
    end

    board.[]=(square, human.marker)
  end

  def cpu_turn?
    current_player == CPU_MARKER
  end

  def cpu_randomly_picks_square
    board[board.unmarked_keys.sample] = cpu.marker
  end

  def cpu_place_piece_at_5
    board[5] = cpu.marker
  end

  def cpu_mark_win_square(win_line)
    board[cpu.get_win_square(win_line, board.squares)] = cpu.marker
  end

  def cpu_mark_threat_square(threat_line)
    board[cpu.get_threat_square(threat_line, board.squares)] = cpu.marker
  end

  # The following 3 methods are conditional checks to be used in the
  # `possible_cpu_moves` method. These were extracted into their own methods in
  # an attempt to appeas the `rubocop AbcSize` cop. I think it's a bit redundant
  # but did so anyway

  def check_for_square_5(brd, threat_line, win_line)
    threat_line.empty? && win_line.empty? && brd.squares[5].marker == ' '
  end

  def check_for_possible_win(win_line)
    !win_line.empty?
  end

  def check_for_any_threat(threat_line)
    !threat_line.empty?
  end

  def possible_cpu_moves(threat_line, win_line)
    if check_for_square_5(board, threat_line, win_line)
      cpu_place_piece_at_5
    elsif check_for_possible_win(win_line)
      cpu_mark_win_square(win_line)
    elsif check_for_any_threat(threat_line)
      cpu_mark_threat_square(threat_line)
    else
      cpu_randomly_picks_square
    end
  end

  def cpu_moves!(brd)
    threat_line = cpu.detect_threat(brd.squares)
    win_line = cpu.detect_win(brd.squares)
    possible_cpu_moves(threat_line, win_line)
  end

  def current_player_moves
    if cpu_turn?
      cpu_moves(board)
      @current_player = HUMAN_MARKER
    elsif human_turn?
      human_moves
      @current_player = CPU_MARKER
    end
  end

  def update_score
    case board.winning_marker
    when HUMAN_MARKER
      human.increment_wins
      cpu.increment_losses
    when CPU_MARKER
      cpu.increment_wins
      human.increment_losses
    end
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
    false
  end

  def game_loading
    prompt MSG['loading']
    sleep(5)
    system 'clear'
  end

  def game_setup
    clear_screen
    display_welcome_message
    human.set_name
    cpu.set_name
    state_first_player
  end

  def reset
    board.reset
    clear_screen
  end

  def player_turn_loop
    loop do
      current_player_moves
      break if board.someone_won? || board.full?
      clear_screen_display_board
    end
  end

  def main_game_loop
    loop do
      display_board
      player_turn_loop
      update_score
      display_result
      break unless play_again?
      confirm_play_again_message
      reset
    end
  end
end

game = TTTGame.new
game.play
