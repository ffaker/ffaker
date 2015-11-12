require 'test_helper'

class TestColorUA < Minitest::Test
  def test_name
    assert_match /\A[а-яА-ЯіїєґІЇЄҐ’\-\s]+\z/, FFaker::ColorUA.name
  end
end
