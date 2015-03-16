# encoding: utf-8

require 'helper'

class TestFakerNameTH < Test::Unit::TestCase

  def setup
    @tester = FFaker::NameTH
  end

  def test_last_name
    assert FFaker::NameTH::LAST_NAMES.include?(@tester.last_name)
  end

  def test_first_name
    assert FFaker::NameTH::FIRST_NAMES.include?(@tester.first_name)
  end

  def test_nick_name
    assert FFaker::NameTH::NICK_NAMES.include?(@tester.nick_name)
  end

  def test_name
    parts = @tester.name.split(' ')
    assert FFaker::NameTH::FIRST_NAMES.include?(parts[0])
    assert FFaker::NameTH::LAST_NAMES.include?(parts[1])
  end

end