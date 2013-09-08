class OfcpCardCounter::CardCounter
  # Creates a new instance of CardCounter
  #
  # @param [Hash] options :turns_left:
  # @option options [Number] :turns_left the number of cards yet to be dealt to the player
  # @option options [Array<String>]  :cards a collection containing the cards that are already known
  # @return [CardCounter] a fresh new instance of CardCounter
  def initialize(options={})
    @turns_left = options[:turns_left]
    @cards      = options[:cards]
  end

  # Calculate the dependent probability of receiving a specific quantity of
  # of cards from a pool of desired options
  #
  # @param [Number] number the number of cards from the desired array that you need
  # @param [Hash] options
  # @option options [Array<String>] :of the pool of cards you desire
  # @return [Float] dependent probability as a scalar between 0 and 1
  # @example probability of getting 2 of the 3 remaining 4's
  #   @card_counter = OfcpCardCounter::CardCounter.new(:turns_left => 2, :cards => %w{4S 3H 3D})
  #   @card_counter.probability_of_getting(2, :of => %w{4H 4D 4C}) #=> 0.002551020408163265

  def probability_of_getting(number, options={})
    return 1.0 if number <= 0 || options[:of].nil?

    targets = options[:of] - @cards
    targets_left = targets.count.to_f
    turns_left   = (options[:turns_left] || @turns_left).to_f
    cards_left   = (options[:cards_left]   || 52 - @cards.count).to_f

    return 0.0 if turns_left < number

    successful_case  = targets_left / cards_left
    successful_case *= probability_of_getting (number - 1), :of => targets[1..-1], :cards_left => (cards_left - 1), :turns_left => (turns_left - 1)

    unsuccessful_case  = (cards_left - targets_left) / cards_left
    unsuccessful_case *= probability_of_getting number, :of => targets, :cards_left => (cards_left - 1), :turns_left => (turns_left - 1)

    successful_case + unsuccessful_case
  end
end
