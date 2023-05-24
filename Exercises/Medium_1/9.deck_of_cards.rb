# Deck of Cards

# Using the Card class from the previous exercise, create a Deck class that
# contains all of the standard 52 playing cards. Use the following code to start
# your work:

# The Deck class should provide a #draw method to deal one card. The Deck should
# be shuffled when it is initialized and, if it runs out of cards, it should
# reset itself by generating a new set of 52 shuffled cards.

class Deck
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  attr_reader :deck

  def initialize
    set_deck
  end

  def draw
    if deck.empty?
      set_deck
      deck.pop
    else
      deck.pop
    end
  end

  private

  attr_writer :deck

  def set_deck
    self.deck = []

    SUITS.each do |suit|
      RANKS.each do |rank|
        deck << Card.new(rank, suit)
      end
    end
    deck.shuffle!
  end
end

class Card
  include Comparable

  attr_reader :rank, :suit

  FACE_VALUES = {"Jack" => 11, "Queen" => 12, "King" => 13, "Ace" => 14}

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def get_value
    FACE_VALUES[rank] ? FACE_VALUES[rank] : rank
  end

  def <=>(other_card)
    get_value <=> other_card.get_value
  end

  def to_s
    "#{rank} of #{suit}"
  end
end

deck = Deck.new
drawn = []
52.times { drawn << deck.draw }
p drawn.count { |card| card.rank == 5 } == 4
p drawn.count { |card| card.suit == 'Hearts' } == 13

drawn2 = []
52.times { drawn2 << deck.draw }
p drawn != drawn2 # Almost always.