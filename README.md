Ofcp Card Counter
=================

Statistics calculations for Open Face Chinese Poker hands

Basic Usage
-----------

Calculates the dependent probability of receiving one or more cards left
in the deck.

    @card_counter = OfcpCardCounter::CardCounter.new(
      :turns_left => 3, # Number of cards this player is yet to get
      :cards => %w{2H 3H 4H} # All cards that are already known and dealt
    )
    @card_counter.probability_of_getting 2, :of => %w{5H 6H}
    #=> 0.002551020408163265


    @card_counter = OfcpCardCounter::CardCounter.new(
      :turns_left => 10, # Number of cards this player is yet to get
      :cards => %w{4H JH QH} # All cards that are already known and dealt
    )
    @card_counter.probability_of_getting 2, :of => %w{2H 3H 5H 6H 7H 8H 9H 10H KH AH}
    #=> 0.6647656110932596

