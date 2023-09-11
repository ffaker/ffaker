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

  def test_url_output_with_keyword_arguments
    output = capture_output do
      @tester.url(format: 'jpg')
    end

    assert_equal ['', ''], output
  end

  def test_url_with_size_as_positional_argument
    assert_match(%r(#{Regexp.quote(PLACEHOLDER)}150x320/[0-9a-f]{6}/[0-9a-f]{6}\.png\?text=), @tester.url('150x320'))
  end

  def test_url_output_with_positional_arguments
    output = capture_output do
      @tester.url('150x320')
    end

    assert_equal(
      ['', "Positional arguments for Image#url are deprecated. Please use keyword arguments.\n"],
      output
    )
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

  def test_file_output_with_keyword_arguments
    output = capture_output do
      @tester.file(format: 'jpg')
    end

    assert_equal ['', ''], output
  end

  def test_file_with_size_as_positional_argument
    assert_equal(@tester.file('150x320').class.name, 'File')
  end

  def test_file_output_with_positional_arguments
    output = capture_output do
      @tester.file('150x320')
    end

    assert_equal(
      ['', "Positional arguments for Image#file are deprecated. Please use keyword arguments.\n"],
      output
    )
  end
end
