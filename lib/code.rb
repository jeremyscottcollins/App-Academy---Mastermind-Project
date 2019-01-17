class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  attr_reader :pegs

  def initialize(chars)
    raise if !Code.valid_pegs?(chars)
    @pegs = chars.map(&:upcase)
  end

  def self.valid_pegs?(chars)
    chars.all? { |char| POSSIBLE_PEGS.include?(char.upcase) }
  end
  
  def self.random(length)
    pegs = Array.new(length) { POSSIBLE_PEGS.keys.sample }
    Code.new(pegs)
  end

  def self.from_string(string)
    Code.new(string.split(""))
  end

  def [](index)
    @pegs[index]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(guess)
    (0...guess.length).count { |i| guess[i] == @pegs[i]}
  end

  def num_near_matches(guess)
    (0...guess.length).count do |i|
      guess_peg = guess[i]
      @pegs.include?(guess_peg) && guess_peg != @pegs[i]
    end
  end

  def ==(other_code)
    self.pegs == other_code.pegs
  end
end
