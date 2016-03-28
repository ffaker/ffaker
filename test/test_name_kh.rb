require 'helper'

class TestFakerNameKH < Test::Unit::TestCase
  def setup
    @nameKH = FFaker::NameKH
  end

  def test_last_name
    assert_include @nameKH::LAST_NAMES, @nameKH.last_name
  end

  def test_first_name
    assert_include @nameKH::FIRST_NAMES, @nameKH.first_name
  end

  def test_nick_name
    assert_include @nameKH::NICK_NAMES, @nameKH.nick_name
  end

  def test_name
    last_name, first_name = @nameKH.name.split(' ')
    assert_include @nameKH::FIRST_NAMES, first_name
    assert_include @nameKH::LAST_NAMES, last_name
  end
end
