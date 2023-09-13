# frozen_string_literal: true

require_relative 'helper'

class TestAvatar < Test::Unit::TestCase
  include DeterministicHelper

  ROBOHASH = 'https://robohash.org'

  assert_methods_are_deterministic(FFaker::Avatar, :image)

  def setup
    @tester = FFaker::Avatar
  end

  def test_avatar
    assert_match(%r{\Ahttps://robohash\.org/.+\.png\?size=300x300\z},
                 @tester.image)
  end

  def test_image_output_with_keyword_arguments
    output = capture_output do
      @tester.image(format: 'jpg')
    end

    assert_equal ['', ''], output
  end

  def test_image_with_slug_as_positional_argument
    assert_equal("#{ROBOHASH}/foobar.png?size=300x300", @tester.image('foobar'))
  end

  def test_image_output_with_positional_arguments
    output = capture_output do
      @tester.image('foobar')
    end

    assert_equal(
      ['', "Positional arguments for Avatar#image are deprecated. Please use keyword arguments.\n"],
      output
    )
  end

  def test_avatar_with_param
    assert_equal("#{ROBOHASH}/faker.png?size=300x300", @tester.image(slug: 'faker'))
  end

  def test_avatar_with_correct_size
    assert_equal("#{ROBOHASH}/faker.png?size=150x320",
                 @tester.image(slug: 'faker', size: '150x320'))
  end

  def test_avatar_with_incorrect_size
    assert_raise ArgumentError do
      @tester.image(size: '150x320z')
    end
  end

  def test_avatar_with_supported_format
    assert_equal("#{ROBOHASH}/faker.jpg?size=300x300",
                 @tester.image(slug: 'faker', size: '300x300', format: 'jpg'))
  end

  def test_avatar_with_incorrect_format
    assert_raise ArgumentError do
      @tester.image(size: '300x300', format: 'wrong_format')
    end
  end

  def test_avatar_with_correct_background
    assert_equal("#{ROBOHASH}/faker.png?size=300x300&bgset=bg1",
                 @tester.image(slug: 'faker', size: '300x300', format: 'png', bgset: '1'))
  end

  def test_avatar_with_incorrect_background
    assert_raise ArgumentError do
      @tester.image(slug: 'faker', size: '300x300', format: 'png', bgset: 'not_a_number')
    end
  end
end
