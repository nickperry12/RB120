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
  def display_enter_number
    puts "Enter a number between #{GuessingGame::RANGE.min} and #{GuessingGame::RANGE.max}"
  end

  def display_invalid_guess
    puts "Invalid guess. Enter a number between #{GuessingGame::RANGE.min} and #{GuessingGame::RANGE.max}"
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

  def player_choice
    choice = nil
    loop do
      choice = gets.chomp.to_i
      break if GuessingGame::RANGE === choice
      display_invalid_guess
    end
    choice
  end
end

class GuessingGame
  include Displayable

  attr_reader :target, :player, :remaining_guesses, :guess, :start_range, :end_range

  def initialize(start_range, end_range)
    @start_range = start_range
    @end_range = end_range
    @target = nil
    @remaining_guesses = nil
    @player = Player.new
  end

  RANGE = (@@start_range..@@end_range)

  # INITIAL_ATTEMPTS = Math.log2(RANGE.max - RANGE.min).to_i + 1

  def output_range
    p RANGE
  end

  def set_target_num
    self.target = rand(RANGE)
  end

  def set_guesses_remaining
    self.remaining_guesses = INITIAL_ATTEMPTS
  end

  def game_setup
    set_target_num
    set_guesses_remaining
  end

  def player_guess
    player.player_choice
  end

  def evaluate_guess(guess)
    if guess >= target
      display_guess_too_high
    elsif guess <= target
      display_guess_too_low
    end
  end

  def decrement_guess
    self.remaining_guesses -= 1
  end

  def main_game_loop
    while remaining_guesses > 0
      display_guesses_remaining(remaining_guesses)
      display_enter_number
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

  attr_writer :target, :remaining_guesses, :guess
end

game = GuessingGame.new(501, 1500)
p game.start_range
p game.end_range
p game.output_range

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