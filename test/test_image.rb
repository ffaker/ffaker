# frozen_string_literal: true

require_relative 'helper'

class TestImage < Test::Unit::TestCase
  include DeterministicHelper

  PLACEHOLDER = 'https://dummyimage.com/'

  assert_methods_are_deterministic(FFaker::Image, :url)

  def setup
    @tester = FFaker::Image
  end

  def test_url
    assert_match(%r(#{Regexp.quote(PLACEHOLDER)}300x300/[0-9a-f]{6}/[0-9a-f]{6}\.png\?text=),
                 @tester.url)
  end

  def test_image_url_with_param
    assert_equal("#{PLACEHOLDER}300x300//.png?text=",
                 @tester.url(size: '300x300', format: 'png', bg_color: nil, text_color: nil))
  end

  def test_image_url_with_correct_size
    assert_match(%r(#{Regexp.quote(PLACEHOLDER)}150x320/[0-9a-f]{6}/[0-9a-f]{6}\.png\?text=),
                 @tester.url(size: '150x320'))
  end

  def test_image_url_with_incorrect_size
    assert_raise ArgumentError do
      @tester.url(size: '150x320z')
    end
  end

  def test_image_url_with_supported_format
    assert_match(%r(#{Regexp.quote(PLACEHOLDER)}300x300/[0-9a-f]{6}/[0-9a-f]{6}\.jpg\?text=),
                 @tester.url(size: '300x300', format: 'jpg'))
  end

  def test_image_url_with_incorrect_format
    assert_raise ArgumentError do
      @tester.url(size: '300x300', format: 'wrong_format')
    end
  end

  def test_image_file
    assert_equal(@tester.file.class.name, 'File')
  end
end
