# frozen_string_literal: true

require_relative 'helper'

class TestFakerFilesystem < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(
    FFaker::Filesystem,
    :extension, :mime_type, :file_name
  )

  def setup
    @tester = FFaker::Filesystem
  end

  def test_extension
    assert_match /\A(?:flac|mp3|wav|bmp|gif|jpeg|jpg|png|tiff|css|csv|html|js|
                     json|txt|mp4|avi|mov|webm|doc|docx|xls|xlsx|ppt|pptx|odt|
                     ods|odp|pages|numbers|key|pdf)\z/x,
                 @tester.extension
  end

  def test_mime_type_format
    assert_match %r{\A\w+/.+\z}, @tester.mime_type
  end

  def test_directory
    assert_match %r{\A(?:[a-z_-]+[\\/])+[a-z_-]+\z}, @tester.directory
  end

  def test_file_name
    assert_match %r{\A(?:[a-z_-]+[\\/])+[a-z_-]+\.\w{2,4}\z},
      @tester.file_name
  end
end
