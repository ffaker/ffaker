# encoding: utf-8

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
    assert @tester.extension.match(/(flac|mp3|wav|bmp|gif|jpeg|jpg|png|tiff|css|csv|html|js|json|txt|mp4|avi|mov|webm|doc|docx|xls|xlsx|ppt|pptx|odt|ods|odp|pages|numbers|key|pdf)/)
  end

  def test_mime_type_format
    assert @tester.mime_type.match(/(.*)\/(.*)+/)
  end

  def test_file_name
    assert @tester.file_name.match(/([a-z\-_]+)(\\|\/)([a-z\-_]+)\.([a-z]+)/)
  end
end
