# Refactored RPS

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
      break if ['rock', 'paper', 'scissors'].include?(choice)
      puts "Sorry, the move you entered is invalid. Please enter a valid choice."
    end
    self.move = choice
  end
end

class Computer < Player
  def set_name
    self.name = ['C3P0', 'R2D2', 'Robocop', 'Sonny'].sample
  end

  def choose
    self.move = ['rock', 'paper', 'scissors'].sample
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

# Questions

=begin
Question 1:

Is this design, with Human and Computer sub-classes, better? Why, or why not?

I believe it is, because it falls in line with the principles of OOP. We're
creating different classes that inherit behaviors from a parent class. Through
this we're achieving polymorphism, one of the key components of OOP. Doing
things this way also reduces the amount of dependencies in our code, while also
reducing the complexity.

Question 2:

The primary improvement is achieving polymorphism through inheritance as well as
duck typing. Both the `Human` and `Computer` class inherit behaviors from the
`Player` superclass. We're achieving polymorphism through duck typing as objects
of the `Human` and 'Computer` class both respond to a `choose` instance method,
though their implementation is different (we still have intention which is what
makes this polymorphism). 

We're also extracting logic from one large method and placing them within their
own instance methods in their respective classes. This reduces complexity and
makes it easier to see what each method is responsible for. We can also make
changes to the method without affecting how another class responds to that same
method call.

Question 3:

The primary drawback would be there are more classes and objects to keep track
of now, but the tradeoff is that there is reduced complexity within our methods.
For example, while we have two new classes (`Human`, `Computer`), we also have
reduced complexity in our `choose` method, as the logic for whether the it's a
`Human` move or `Computer` move has been extacted to their own methods within
their respective classes. We now no longer have to worry about using `if/else`
statements, and having one giant bloated method with alot of logic in it.
=end
