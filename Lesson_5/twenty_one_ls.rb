=begin
Twenty one is a game involving a player, a dealer and a deck of cards. Both the
player and dealer are dealt cards, and try to get as close to a score of 21 as
possible without going over

- Cards are dealt from a deck of 52 cards
- Both dealer and player are dealt two cards initially
- The player takes the first turn and can either hit or stay
- If the player hits, they are dealt another card and their total is updated
- If the player busts, he loses. If he stays, its the dealers turn
- The dealer can choose to hit until his cards add up to at least 17
- If the dealer busts, the player wins. 
- If both the dealer and player stay, the one with the higher total wins
- If totals are equal, it's a tie

Extract nouns and verbs

Nouns: player, dealer, deck, total, card, game
Verbs: deal, hit, stay, bust, win, update

Total most likely won't be a class, we can instead use it as a method within
a class -- `calculate_total`

Another thing to note is that `bust` isn't an action any player is performing,
it's a state -- is the player or dealer busted?

Write out classes and organize verbs:

Player
- hit
- stay
- busted?
- total

Dealer
- hit
- stay
- busted?
- total

Deck
- deal

Card

Game
- start/play

Write a spike:
=end
require 'yaml'
FILE = File.open('twenty_one_rules.txt')

module Displayable
  def clear_screen
    system 'clear'
  end

  def display_welcome_message
    FILE.each do |line|
      puts line
    end
    puts ""
  end

  def display_initial_cards
    prompt "#{human.name} has a #{human.cards[0]} and a #{human.card[1]}!"
    prompt "#{dealer.name} has a #{dealer.cards.sample} and one facedown card."
  end
end

module Formatable
  def prompt(str)
    puts "=> "
  end
end

class Participant
  attr_reader :cards

  def initialize
    @wins = 0
    @losses = 0
    @cards = []
  end

  def hit
    prompt MSG['player_hit'] if self.class == Player
    prompt MSG['dealer_hit'] if self.class == Dealer
    self.cards << deck.deal_card!
  end

  def stay
    case self.class
    when Dealer
      prompt MSG['dealer_stay']
    when Player
      prompt MSG['player_stay']
    end
  end

  def busted?

  end

  def blackack?

  end
end

class Player < Participant
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

  def hit_or_stay?
    prompt MSG['player_turn']
    choice = nil

    loop do
      choice = gets.chomp.dowcase
      break if ['hit', 'h'].include?(choice)
      prompt MSG['invalid_choice']
    end

    choice
  end

  private

  attr_writer :name
end

class Dealer < Participant
  DEALERS = [
    'Joe Cool',
    'Danny Ocean',
    'Rusty Ryan',
    'Alan Garner',
    'James Bond',
    'Le Chiffre',
    'Raymond Babbitt',
    'Number Two'
  ]

  def set_name
    self.name = names.sample
  end
  
  private

  attr_writer :name
end

class Card
  attr_reader :suit, :face

  SUITS = %w(Hearts Diamonds Clubs Spades)
  FACES = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace']

  def initialize(suit, face)
    @suit = suit
    @face = face
  end

  def to_s
    "The #{face} of #{suit}"
  end

  def ace?
    face == 'Ace'
  end

  def king?
    face == 'King'
  end

  def queen?
    face == 'Queen'
  end

  def jack?
    face == 'Jack'
  end
end

class Deck
  def initialize
    cards = []
    Cards::SUITS.each do |suit|
      Cards::FACES.each do |face|
        @cards << Card.new(suit, face)
      end
    end

    shuffle_deck!
  end

  def shuffle_deck!
    cards.shuffle!
  end

  def deal_card!
    cards.pop
  end
end

class TwentyOne
  attr_reader :human, :dealer, :deck

  def initialize
    @human = Player.new
    @dealer = Dealer.new
    @deck = Deck.new
  end

  def deal_players_cards!
    2.times do
      human.cards << deck.deal_card!
      dealer.cards << deck.deal_card!
    end
  end

  def player_turn!
    loop do
      case human.hit_or_stay?
      when 'h' || 'hit'
        human.hit
      when 's' || 'stay'
        human.stay
        break
      end
    end
  end

  def dealer_turn!

  end

  def game_setup
    clear_screen
    display_welcome_message # NYI
    human.set_name
    dealer.set_name
  end

  def main_game_loop
    deal_players_cards!
    display_cards # NYI
    player_turn! # NYI
    dealer_turn! # NYI
    show_result # NYI
    play_again? # NYI
  end

  def play
    game_setup
    game_loading # NYI
    main_game_loop # NYI
    display_goodbye_message # NYI
  end
end