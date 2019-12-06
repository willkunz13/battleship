require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require_relative '../lib/game'

class GameTest < Minitest::Test

  def setup
    @game = Game.new
  end

  def test_it_can_display_the_ascii_ship
    @game.welcome
    assert_includes "Welcome", @game.welcome
  end

end
