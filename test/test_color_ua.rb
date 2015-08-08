# encoding: utf-8

require 'helper'

class TestColorUA < Test::Unit::TestCase
  def test_name
    assert_match /\A[а-яА-ЯіїєґІЇЄҐ’\-\s]+\z/, FFaker::ColorUA.name
  end
end
