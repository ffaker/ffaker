# encoding: utf-8
# => author: guapolo github.com/guapolo
require 'helper'

class TestAddressMX < Test::Unit::TestCase
  def setup
    @tester = Faker::AddressMX
  end
  
  def test_mx_state
    assert_match /[ A-Za-z]/, @tester.state
  end

  def test_mx_state_abbr
    assert_match /[A-Z]/, @tester.state_abbr
  end

  def test_postcode
    assert_match /[0-9]/, @tester.zip_code
  end
  
  def test_mx_municipality
    assert_match /[ a-z]/, @tester.municipality
  end
end
