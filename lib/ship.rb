require 'pry'

class Ship
	attr_accessor :health
  attr_reader :name, :length
  def initialize(name, length)
    @name = name
    @length = length
    @health = @length.dup
  end

  def hit
    @health -= 1
  end

  def sunk?
    if @health < 1
      return true
    else
      false
    end
  end

end
