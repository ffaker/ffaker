require 'helper'

class TestFakerNameKH < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(
    FFaker::NameKH,
    :last_name, :first_name, :nick_name, :name
  )

  def setup
    @name_KH = FFaker::NameKH
  end

  def test_last_name
    assert_include @name_KH::LAST_NAMES, @name_KH.last_name
  end

  def test_first_name
    assert_include @name_KH::FIRST_NAMES, @name_KH.first_name
  end

  def test_nick_name
    assert_include @name_KH::NICK_NAMES, @name_KH.nick_name
  end

  def test_name
    last_name, first_name = @name_KH.name.split(' ')
    assert_include @name_KH::FIRST_NAMES, first_name
    assert_include @name_KH::LAST_NAMES, last_name
  end
end
