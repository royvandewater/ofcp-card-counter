class OfcpCardCounter::CardCounter
  def initialize(options={})
    @turns_left = options[:turns_left]
    @cards      = options[:cards]
  end

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
