# encoding: utf-8

require 'helper'

class TestFakerNameNL < Minitest::Test
  def setup
    @tester = FFaker::NameNL
  end

  def test_name
    assert @tester.name.match(/(\w+\.? ?){2,3}/)
  end

  def test_prefix
    assert @tester.prefix.match(/[A-Z][a-z]+\.?/)
  end

  def test_suffix
    assert @tester.suffix.match(/[A-Z][a-z]*\.?/)
  end
end
