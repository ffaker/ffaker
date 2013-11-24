# encoding: utf-8

require 'helper'

class TestFakerIdentificationES < Test::Unit::TestCase
  def setup
    @tester = Faker::IdentificationES
  end

  def test_gender
    assert_match /(Hombre|Mujer)/, @tester.gender
  end
end
