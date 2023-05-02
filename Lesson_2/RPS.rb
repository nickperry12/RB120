class Player
  attr_accessor :move, :name

  def initialize(player_type = :human)
    @player_type = player_type
    @move = nil
    set_name
  end

  def set_name
    if human?
      n = ''
      loop do
        puts "Please enter your name:"
        n = gets.chomp
        break unless n.empty? || n.gsub(' ', '').empty?
        puts "Sorry, the field cannot be left blank. Please enter a valid name."
      end
      self.name = n
    else
      self.name = ['C3P0', 'R2D2', 'Robocop', 'Sonny'].sample
    end
  end

  def choose
    if human?
      choice = nil
      loop do
        puts "Please choose rock, paper, or scissors:"
        choice = gets.chomp.downcase
        break if ['rock', 'paper', 'scissors'].include?(choice)
        puts "Sorry, the move you entered is invalid. Please enter a valid choice."
      end
      self.move = choice
    else
      self.move = ['rock', 'paper', 'scissors'].sample
    end
  end

  def human?
    @player_type == :human
  end
end

# Game Orchestration Engine
class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Player.new
    @computer = Player.new(:computer)
  end

  def display_welcome_message
    puts "Hi #{human.name}! Welcome to Rock, Paper, Scissors!"
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors. Goodbye!"
  end

  def display_winner
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."

    case human.move
    when 'rock'
      puts "It's a tie!" if computer.move == "rock"
      puts "#{human.name} wins!" if computer.move == "scissors"
      puts "#{computer.name} won!" if computer.move == "paper"
    when 'paper'
      puts "It's a tie!" if computer.move == "paper"
      puts "#{human.name} wins!" if computer.move == "rock"
      puts "#{computer.name} won!" if computer.move == "scissors"
    when 'scissors'
      puts "It's a tie!" if computer.move == "scissors"
      puts "#{human.name} wins!" if computer.move == "paper"
      puts "#{computer.name} won!" if computer.move == "rock"
    end
  end

  def play_again?
    answer = ''
    loop do
      puts "Would you like to play again? Choose [y]es or [n]o."
      answer = gets.chomp.downcase
      break if ['y', 'n', 'yes', 'no'].include?(answer)
      puts "Sorry, that input is invaid. Must be [y]es or [n]o."
    end

    return true if answer == 'y' || answer == 'yes'
    return false
  end

  def play
    display_welcome_message
    loop do
      human.choose
      computer.choose
      display_winner
      break unless play_again?
    end
    display_goodbye_message
  end
end

RPSGame.new.play