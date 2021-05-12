# frozen_string_literal: true

require_relative 'helper'

class TestCompanyJA < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(
    FFaker::CompanyJA,
    :name, :position
  )

  def setup
    @tester = FFaker::CompanyJA
  end

  def test_name
    assert_match(japanese_regex(''), @tester.name)
  end

  def test_position
    assert_match(japanese_regex(''), @tester.position)
  end

  def japanese_regex(word)
    /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+#{word}\z/
  end
end
