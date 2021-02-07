
class Turn
  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    # player 1 card not equal to player2 card
    if player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
      return :basic
    end
  end

  def winner
    if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
      return player1
    else player1.deck.rank_of_card_at(0) < player2.deck.rank_of_card_at(0)
      return player2
    end
  end

  def pile_cards
    if type == :basic
      @spoils_of_war << player1.deck.remove_card
      @spoils_of_war << player2.deck.remove_card
      @spoils_of_war.flatten
    end
  end

  def award_spoils(winner)
    winner.deck.cards << @spoils_of_war.shift(spoils_of_war.length)
    winner.deck.cards.flatten!
  end


end
