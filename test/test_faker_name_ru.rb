# encoding: utf-8
require 'helper'

class TestFakerNameRu < Test::Unit::TestCase
  def setup
    @tester = Faker::NameRU
  end
  
  def test_name
    words = @tester.name.split
    assert [2,3].include?(words.size)
    assert words.each { |word| word.match /[А-Я][а-я]+/ }
  end
end
