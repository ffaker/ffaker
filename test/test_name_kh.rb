# frozen_string_literal: true

require_relative 'helper'

class TestFakerNameKH < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(
    FFaker::NameKH,
    :last_name, :first_name, :nick_name, :name
  )

  def setup
    @name_kh = FFaker::NameKH
  end

  def test_last_name
    assert_include @name_kh::LAST_NAMES, @name_kh.last_name
  end

  def test_first_name
    assert_include @name_kh::FIRST_NAMES, @name_kh.first_name
  end

  def test_nick_name
    assert_include @name_kh::NICK_NAMES, @name_kh.nick_name
  end

  def test_name
    last_name, first_name = @name_kh.name.split(' ')
    assert_include @name_kh::FIRST_NAMES, first_name
    assert_include @name_kh::LAST_NAMES, last_name
  end
end
