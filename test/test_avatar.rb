require 'helper'

class TestAvatar < Test::Unit::TestCase

  def test_avatar
    assert FFaker::Avatar.image.match(/http:\/\/robohash\.org\/(.+)\.png/)[1] != nil
  end

  def test_avatar_with_param
    assert FFaker::Avatar.image('faker').match(/http:\/\/robohash\.org\/(.+)\.png/)[1] == 'faker'
  end

  def test_avatar_with_correct_size
    assert FFaker::Avatar.image('faker', '150x320').match(/http:\/\/robohash\.org\/faker\.png\?size=(.+)/)[1] == '150x320'
  end

  def test_avatar_with_incorrect_size
    assert_raise ArgumentError do
      FFaker::Avatar.image(nil, '150x320z')
    end
  end

  def test_avatar_with_supported_format
    assert_match /http:\/\/robohash\.org\/faker\.jpg/, FFaker::Avatar.image('faker', '300x300', 'jpg')
  end

  def test_avatar_with_incorrect_format
    assert_raise ArgumentError do
      FFaker::Avatar.image(nil, '300x300', 'wrong_format')
    end
  end

  def test_avatar_with_correct_background
    assert FFaker::Avatar.image('faker', '300x300', 'png', '1').match(/http:\/\/robohash\.org\/faker\.png\?size=300x300&(.+)/)[1] == "bgset=bg1"
  end

  def test_avatar_with_incorrect_background
    assert_raise ArgumentError do
      assert FFaker::Avatar.image('faker', '300x300', 'png', 'not_a_number').match(/http:\/\/robohash\.org\/faker\.png\?size=300x300&(.+)/)[1] == "bgset=bg1"
    end
  end

end