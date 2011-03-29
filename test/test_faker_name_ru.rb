# encoding: utf-8
require 'helper'

class TestFakerNameRu < Test::Unit::TestCase
  def setup
    @tester = Faker::NameRU
    @words = @tester.name.split
  end
  
  def test_name
    assert [2,3].include?(@words.size)
    assert @words.each { |word| word.match /[А-Я][а-я]+/ }
  end
  
  def test_name_sex
    assert same_sex?(@words)
  end
  
  def test_uniqueness
    unique_names = (1..10000).map { @tester.name }.uniq.size
    assert unique_names > 9900, "got only #{unique_names} unique names out of 10000"
  end
  
  def test_last_name
    assert @tester.last_name.match(/[А-Я][а-я]+/)
  end
  
  def test_first_name
    assert @tester.first_name.match(/[А-Я][а-я]+/)
  end
  
  def test_patronymic
    assert @tester.patronymic.match(/[А-Я][а-я]+/)
  end
  
  def test_with_same_sex
    names = []
    @tester.with_same_sex do
      names << @tester.last_name
      names << @tester.first_name
      names << @tester.patronymic
    end
    assert same_sex?(names)
  end
  
  # checks if every name is of the same sex
  def same_sex?(words)
    [:male, :female].any? do |sex|
      words.all? do |word|
        [Faker::NameRU::LAST_NAMES, Faker::NameRU::FIRST_NAMES, Faker::NameRU::PATRONYMICS].any? do |names|
          names[sex].include?(word)
        end
      end
    end
  end
end
