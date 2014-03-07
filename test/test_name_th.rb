# encoding: utf-8

require 'helper'

class TestFakerNameTH < Test::Unit::TestCase

  def setup
    @tester = Faker::NameTH
  end

  def test_last_name
    assert Faker::NameTH::LAST_NAMES.include?(@tester.last_name)
  end

  def test_first_name
    assert Faker::NameTH::FIRST_NAMES.include?(@tester.first_name)
  end

  def test_nick_name
    assert Faker::NameTH::NICK_NAMES.include?(@tester.nick_name)
  end

  def test_name
    parts = @tester.name.split(' ')
    assert Faker::NameTH::FIRST_NAMES.include?(parts[0])
    assert Faker::NameTH::LAST_NAMES.include?(parts[1])
  end

end