class Hanoi

  attr_accessor :rods

  # Greater number is the greater disc
  #    _|_    [1]
  #   __|__   [2]
  #  ___|___  [3]
  def initialize
    @rods = {
      a: [3,2,1],
      b: [],
      c: []
    }
  end

  def rod(p)
    @rods[p]
  end

  def allowed_move(from, to)
    return false if rod(from).empty?
    return true if rod(to).empty?
    rod(to).last > rod(from).last
  end

  def move(from, to)
    raise Exception.new unless allowed_move(from, to)
    disc = rod(from).pop
    rod(to).push disc
  end

  def finished?
    rod(:a).empty? && rod(:b).empty? && not(rod(:c).empty?)
  end
end
