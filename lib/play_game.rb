require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/turn'

class PlayGame
  attr_writer :guess

  attr_reader :cards

  def initialize(guess, cards)
    @guess = guess
    @cards = cards
  end

  def start
    p "Welcome! You're playing with 4 cards."
    p "-------------------------------------------------"

    deck = Deck.new(@cards)
    round = Round.new(@cards)
    game = Turn.new(@guess, @cards)
    counter = 1

    until deck.cards.cards.empty? == true
      p "This is card number #{counter} out of 4."
      p "Question #{counter} is: #{round.current_card.question}"
      @guess = gets.chomp.downcase
      answer = round.take_turn(@guess)
      p answer.feedback
      counter += 1
    end

    p "****** Game over! ******"
    p "You had #{round.number_correct} correct guesses out of 4 for a total score of #{round.percent_correct}%."

    p "STEM - #{round.percent_correct_by_category(:STEM)}% correct"
    p "Turing Staff - #{round.percent_correct_by_category(:TuringStaff)}% correct"
    p "Pop Culture - #{round.percent_correct_by_category(:PopCulture)}% correct"
    # require 'pry'; binding.pry
  end
end
