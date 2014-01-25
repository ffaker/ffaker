# encoding: utf-8

require 'helper'

class TestFakerNamePH < Test::Unit::TestCase
  def setup
    @tester = Faker::NamePH
  end

  def test_name
    assert @tester.name.match(/(\w+\.? ?){2,3}/)
  end

  def test_prefix
    assert @tester.prefix.match(/[A-Z][a-z]+\.?/)
  end
end
