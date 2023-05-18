class Person
  attr_reader :hand

  def initialize
    @hand = []
  end
end

class Dealer
  attr_reader :human

  def initialize
    @human = Person.new
  end

  def deal_cards
    human.hand << [10, 'Hearts']
  end

  def show_cards
    human.hand
  end
end

dealer = Dealer.new
dealer.deal_cards
p dealer.show_cards