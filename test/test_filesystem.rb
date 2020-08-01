# frozen_string_literal: true

require 'helper'

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
    assert @tester.extension.match(
      /\A(?:flac|mp3|wav|bmp|gif|jpeg|jpg|png|tiff|css|csv|html|js|json|txt|mp4|
          avi|mov|webm|doc|docx|xls|xlsx|ppt|pptx|odt|ods|odp|pages|numbers|key|
          pdf)\z/x
    )
  end

  def test_mime_type_format
    assert @tester.mime_type.match(%r{\A\w+/.+\z})
  end

  def test_file_name
    assert @tester.file_name.match(%r{\A[a-z_-]+[\\/][a-z_-]+\.[a-z]{2,4}\z})
  end
end
