class Card
  attr_accessor :rank, :suit
 
  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end
 
  def output_card
    puts "The #{@rank} of #{@suit}"
  end
end
 
class Deck
  def initialize
    @ranks = [*(2..10), 'J', 'Q', 'K', 'A']
    @suits = ['♣', '♥', '♠', '♦']
    @cards = []
 
    @ranks.each do |rank|
      @suits.each do |suit|
        @cards << Card.new(rank, suit)
      end
    end
  
  @cards.shuffle!
  end
 
  def deal (number)
    number.times {@cards.pop.output_card}
  end
end
 
deck = Deck.new
#deck.deal(7)

class TwentyFourGame
  EXPRESSIONS = [
    '((%dr %s %dr) %s %dr) %s %dr',
    '(%dr %s (%dr %s %dr)) %s %dr',
    '(%dr %s %dr) %s (%dr %s %dr)',
    '%dr %s ((%dr %s %dr) %s %dr)',
    '%dr %s (%dr %s (%dr %s %dr))',
  ]
 
  OPERATORS = [:+, :-, :*, :/].repeated_permutation(3).to_a

  def self.another_solve(digits)
    solutions = []
    num_perms = digits.permutation.to_a.uniq
    num_perms.each do |a,b,c,d|
      OPERATORS.each do |op1,op2,op3|
        EXPRESSIONS.each do |expr|
          text = expr % [a, op1, b, op2, c, op3, d]
          value = eval(text) rescue next
          solutions << text.delete("r") if value == 24
        end
      end
    end
    solutions
  end
 
  def self.solve(digits)
    solutions = []
    perms = digits.permutation.to_a.uniq
    perms.product(OPERATORS, EXPRESSIONS) do |(a,b,c,d), (op1,op2,op3), expr|
      # evaluate using rational arithmetic
      text = expr % [a, op1, b, op2, c, op3, d]
      value = eval(text)  rescue next
                # catch division by zero
      solutions << text.delete("r")  if value == 24
    end
    solutions
  end
end
