# Number Guesser Part 2

# In the previous exercise, you wrote a number guessing game that determines a
# secret number between 1 and 100, and gives the user 7 opportunities to guess
# the number.

# Update your solution to accept a low and high value when you create a
# GuessingGame object, and use those values to compute a secret number for the
# game. You should also change the number of guesses allowed so the user can
# always win if she uses a good strategy. You can compute the number of guesses
# with:

# Math.log2(size_of_range).to_i + 1

module Displayable
  def display_enter_number(range)
    puts "Enter a number between #{range.min} and #{range.max}"
  end

  def display_invalid_guess(range)
    puts "Invalid guess. Enter a number between #{range.min} and #{range.max}"
  end

  def display_guesses_remaining(guesses_remaining)
    if guesses_remaining == 1
      puts "You have 1 guess remaining"
    else
      puts "You have #{guesses_remaining} geusses remaining."
    end
  end

  def display_guess_too_high
    puts "Your guess is too high."
  end

  def display_guess_too_low
    puts "Your guess is too low."
  end

  def display_you_guessed_it
    puts "That's the number!"
    puts "You won!"
  end

  def display_you_lose
    puts "You ran out of guesses."
    puts "You lose!"
  end

  def display_result(guess)
    guess == target ? display_you_guessed_it : display_you_lose
  end
end

class Player
  include Displayable

  def player_choice(range)
    choice = nil
    loop do
      choice = gets.chomp.to_i
      break if range === choice
      display_invalid_guess(range)
    end
    choice
  end
end

class GuessingGame
  include Displayable

  attr_reader :target, :player, :guess, :range, :attempts

  def initialize(start_range, end_range)
    @range = start_range..end_range
    @target = nil
    @player = Player.new
    @attempts = nil
  end

  def set_number_of_attempts(range)
    self.attempts = Math.log2(range.max - range.min).to_i + 1
  end

  def set_target_num
    self.target = rand(range)
  end

  def game_setup
    set_target_num
    set_number_of_attempts(range)
  end

  def player_guess
    player.player_choice(range)
  end

  def evaluate_guess(guess)
    if guess > target
      display_guess_too_high
    elsif guess < target
      display_guess_too_low
    end
  end

  def decrement_guess
    self.attempts -= 1
  end

  def main_game_loop
    while attempts > 0
      display_guesses_remaining(attempts)
      display_enter_number(range)
      self.guess = player_guess
      evaluate_guess(guess)
      decrement_guess
      break if guess == target
    end
  end

  def play
    game_setup
    main_game_loop
    display_result(guess)
  end

  private

  attr_writer :target, :guess, :attempts
end

game = GuessingGame.new(1, 10)
game.play

# You have 10 guesses remaining.
# Enter a number between 501 and 1500: 104
# Invalid guess. Enter a number between 501 and 1500: 1000
# Your guess is too low.

# You have 9 guesses remaining.
# Enter a number between 501 and 1500: 1250
# Your guess is too low.

# You have 8 guesses remaining.
# Enter a number between 501 and 1500: 1375
# Your guess is too high.