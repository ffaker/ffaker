# frozen_string_literal: true

require_relative 'helper'

class TestCompany < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(
    FFaker::Company,
    :bs, :catch_phrase, :name, :suffix
  )

  def setup
    @tester = FFaker::Company
  end

  def test_bs
    assert_match(%r{\A[ \w'/-]+\z}, @tester.bs)
  end

  def test_catch_phrase
    assert_match(%r{\A[ \w'/-]+\z}, @tester.catch_phrase)
  end

  def test_name
    assert_match(/\A[ \w,'-]+\z/, @tester.name)
  end

  def test_suffix
    assert_include @tester::SUFFIXES, @tester.suffix
  end
end
