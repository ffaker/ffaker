# frozen_string_literal: true

require_relative 'helper'

class TestFakerInternet < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(
    FFaker::Internet,
    :email, :free_email, :safe_email, :disposable_email,
    :user_name, :domain_name, :domain_word, :domain_suffix,
    :http_url, :ip_v4_address, :password, :slug, :mac
  )

  def setup
    @tester = FFaker::Internet
  end

  def test_email
    assert @tester.email.match(/.+@.+\.\w+/)
  end

  def test_email_frozen
    assert @tester.email.frozen? == false
  end

  def test_free_email
    assert @tester.free_email.match(/.+@(gmail|hotmail|yahoo)\.com/)
  end

  def test_disposable_email
    assert @tester.disposable_email.match(/.+@(mailinator\.com|suremail\.info|spamherelots\.com|binkmail\.com|safetymail\.info)/)
  end

  def test_safe_email
    assert @tester.safe_email.match(/.+@example.(com|net|org)/)
  end

  def test_user_name
    assert @tester.user_name.match(/[a-z]+((_|\.)[a-z]+)?/)
  end

  def test_user_name_with_arg
    assert @tester.user_name('bo peep').match(/(bo(_|\.)peep|peep(_|\.)bo)/)
  end

  def test_domain_name
    assert @tester.domain_name.match(/\w+\.\w+/)
  end

  def test_domain_word
    assert @tester.domain_word.match(/^\w+$/)
  end

  def test_domain_suffix
    assert @tester.domain_suffix.match(/^\w+(\.\w+)?/)
  end

  def test_uri
    assert @tester.uri('ftp').match(%r{^ftp://.+})
    assert @tester.uri('http').match(%r{^http://.+})
    assert @tester.uri('https').match(%r{^https://.+})

    assert_deterministic { @tester.uri('ftp') }
    assert_deterministic { @tester.uri('http') }
    assert_deterministic { @tester.uri('https') }
  end

  def test_http_url
    assert @tester.http_url.match(%r{^http://.+})
  end

  def test_ip_v4_address
    assert_match(/\A(?:\d{1,3}\.){3}\d{1,3}\z/, @tester.ip_v4_address)
  end

  def test_slug
    assert_match(/\A[a-z]+[_.-][a-z]+\z/, @tester.slug)
  end

  def test_slug_with_input_words
    assert_not_match(/&/, @tester.slug('Input Words&&Symbols'))
    assert_deterministic { @tester.slug('Input Words&&Symbols') }
  end

  def test_slug_with_specified_glue
    assert_match(/\A[a-z]+-[a-z]+\z/, @tester.slug(nil, '-'))
    assert_deterministic { @tester.slug(nil, '-') }
  end

  def test_password
    assert_match(/\A\w+\z/, @tester.password)
  end

  def test_password_min_length
    assert_greater_than @tester.password(3).length, 2
    assert_greater_than @tester.password(6).length, 5
    assert_greater_than @tester.password(15).length, 14
  end

  def test_password_max_length
    assert_less_than @tester.password(3, 10).length, 11
    assert_less_than @tester.password(7, 15).length, 16
    assert_less_than @tester.password(1, 3).length, 4
  end

  def test_password_fixed_length
    assert @tester.password(20, 20).length == 20
  end

  def test_password_strange_argument
    assert_greater_than @tester.password(10, 2).length, 9
    assert_greater_than @tester.password(3, 1).length, 2
    assert_greater_than @tester.password(8, 5).length, 7
  end

  def test_mac
    assert_match(/\A([a-z0-9]{2}:){5}[a-z0-9]{2}\z/, @tester.mac)
    assert @tester.mac.length == 17
  end

  def test_mac_delimiter_argument
    assert_match(/\A([a-z0-9]{2}-){5}[a-z0-9]{2}\z/, @tester.mac('-'))
    assert_match(/\A([a-z0-9]{2}\.){5}[a-z0-9]{2}\z/, @tester.mac('.'))
    assert_match(/\A([a-z0-9]{2}){6}\z/, @tester.mac(nil))
    assert_match(/\A([a-z0-9]{2}){6}\z/, @tester.mac(''))
    assert @tester.mac('-').length == 17
    assert @tester.mac('.').length == 17
    assert @tester.mac(nil).length == 12
    assert @tester.mac('').length == 12
  end
end
