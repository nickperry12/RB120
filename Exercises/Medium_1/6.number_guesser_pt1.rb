# Number Guesser

# Create an object-oriented number guessing class for numbers in the range 1 to
# 100, with a limit of 7 guesses per game. The game should play like this:

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

  attr_reader :target, :player, :remaining_guesses, :guess

  RANGE = 1..100
  INITIAL_ATTEMPTS = 7

  def initialize
    @target = nil
    @remaining_guesses = nil
    @player = Player.new
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

game = GuessingGame.new
game.play





  # def player_guess!
  #   win = false
  #   until guesses == 0
  #     puts "You have #{guesses} remaining."
  #     puts "Enter a number between 1 and 100:"
  #     guess = nil
  #     loop do
  #       guess = gets.chomp.to_i
  #       if guess_is_greater?(guess)
  #         puts "Your guess is too high."
  #         decrement_guesses
  #         break
  #       elsif guess_is_lesser?(guess)
  #         puts "Your guess is too low."
  #         decrement_guesses
  #         break
  #       elsif guess_is_equal?(guess)
  #         puts "That's the number!"
  #         puts "You won!"
  #         win = true
  #         self.guesses = 0
  #         break
  #       else
  #         puts "Invalid guess. Enter a number between 1 and 100:"
  #       end
  #     end
  #   end
  #   puts "You have no more guesses. You lost!" if win == false
  # end