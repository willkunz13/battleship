require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/ship'
require 'pry'

class ShipTest < Minitest::Test

  def setup
    @cruiser = Ship.new("Cruiser", 3)
  end

  def test_ship_exists
      assert_instance_of Ship, @cruiser
  end

  def test_ship_has_attributes
    assert_equal "Cruiser", @cruiser.name
    assert_equal 3, @cruiser.length
    assert_equal 3, @cruiser.health
  end

  def test_ship_can_be_hit
    @cruiser.hit
    assert_equal 2, @cruiser.health
  end

  def test_ship_can_be_sunk
    @cruiser.hit
    @cruiser.hit
    @cruiser.hit
    assert @cruiser.sunk?
  end
end
