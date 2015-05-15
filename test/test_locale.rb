require 'helper'

class TestLocale < Minitest::Test
  def test_code
    assert_match /./, FFaker::Locale.code
  end

  def test_language
    assert_match /./, FFaker::Locale.language
  end

  def test_language_with_args
    assert_match 'French', FFaker::Locale.language('FR')
  end

  def test_code_with_args
    assert_match 'FR', FFaker::Locale.code('French')
  end
end
