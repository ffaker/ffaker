# encoding: utf-8

require 'helper'

class TestFakerInternet < Test::Unit::TestCase
  def setup
    @tester = Faker::Internet
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
    assert @tester.uri("ftp").match(/^ftp:\/\/.+/)
    assert @tester.uri("http").match(/^http:\/\/.+/)
    assert @tester.uri("https").match(/^https:\/\/.+/)
  end

  def test_http_url
    assert @tester.http_url.match(/^http:\/\/.+/)
  end

  def test_ip_v4_address
    assert @tester.ip_v4_address.match(/\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}/)
  end

  def test_slug
    assert @tester.slug.match(/^[a-z]+(_|\.|\-)[a-z]+$/)
  end

  def test_password
    assert @tester.password.match(/[a-z]+/)
  end

  def test_password_min_length
    assert @tester.password(3).length > 2
    assert @tester.password(6).length > 5
    assert @tester.password(15).length > 14
  end

  def test_password_max_length
    assert @tester.password(3, 10).length < 11
    assert @tester.password(7, 15).length < 16
    assert @tester.password(1, 3).length < 4
  end

  def test_password_strange_argument
    assert @tester.password(10, 2).length > 9
    assert @tester.password(3, 1).length > 2
    assert @tester.password(8, 5).length > 7
  end
end
