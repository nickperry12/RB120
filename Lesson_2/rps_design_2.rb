# Refactored RPS 2

class Move
  attr_reader :value

  VALUES = %w(rock paper scissors)

  def initialize(value)
    @value = value
  end

  def scissors?
    @value == "scissors"
  end

  def rock?
    @value == "rock"
  end

  def paper?
    @value == "paper"
  end

  def >(other_move)
    (rock? && other_move.scissors?) ||
      (paper? && other_move.rock?) ||
      (scissors? && other_move.paper?)
  end

  def <(other_move)
    (rock? && other_move.paper?) ||
      (paper? && other_move.scissors?) ||
      (scissors? && other_move.rock?)
  end
end

class Player
  attr_accessor :move, :name

  def initialize
    set_name
  end
end

class Human < Player
  def set_name
    n = ''
    loop do
      puts "Please enter your name:"
      n = gets.chomp
      break unless n.empty? || n.gsub(' ', '').empty?
      puts "Sorry, the field cannot be left blank. Please enter a valid name."
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      puts "Please choose rock, paper, or scissors:"
      choice = gets.chomp.downcase
      break if Move::VALUES.include?(choice)
      puts "The move you entered is invalid. Please enter a valid choice."
    end
    self.move = Move.new(choice)
  end
end

class Computer < Player
  def set_name
    self.name = ['C3P0', 'R2D2', 'Robocop', 'Sonny'].sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
  end
end

# Game Orchestration Engine

class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts "Hi #{human.name}! Welcome to Rock, Paper, Scissors!"
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors. Goodbye!"
  end

  def display_move
    puts "#{human.name} chose #{human.move.value}."
    puts "#{computer.name} chose #{computer.move.value}."
  end

  def display_winner
    if human.move > computer.move
      puts "#{human.name} won! Congratultions!"
    elsif human.move < computer.move
      puts "#{computer.name} won! Better luck next time!"
    else
      puts "It's a tie! No one wins."
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
    false
  end

  def play
    display_welcome_message
    loop do
      human.choose
      computer.choose
      display_move
      display_winner
      break unless play_again?
    end
    display_goodbye_message
  end
end

RPSGame.new.play

# Questions

# What is the primary improvement of this new design?
# What is the primary drawback of this new design?

=begin
Question 1:

The primary improvement is that we were able to extract the logic from a method
into a separate class `Move`. This class by design checks the conditions for a
player or computer win. We took a large case statement and extracted it to it's
own methods. By extracting this all to it's own class it gives us more
flexibility with our code.

Question 2:

The downside is that we have another class, and the win logic needed to be split
up into two methods in order to make the comparisons. It's also more code for
the reader to look through and decipher. The tradeoff here is flexibiity for
indirection. By refactoring our program this way we are making the code more
flexible; we can make changes without creating large ripple effects throughout
the rest of the program. It also make increases the maintainability of the code.
However, we're trading flexibility for increased indirection. This means that
while our code is more flexible, the reader must dig deeper to understand what
is happening within our code.
=end
