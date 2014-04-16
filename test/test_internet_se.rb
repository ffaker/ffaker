# encoding: utf-8

require 'helper'

class TestFakerInternetSE < Test::Unit::TestCase

  def setup
    @tester = Faker::InternetSE
  end

  def test_email
    assert @tester.email.match(/.+@.+\.\w+/)
  end

  def test_email_frozen
    assert @tester.email.frozen? == false
  end

  def test_disposable_email
    assert @tester.disposable_email.match(/.+@(mailinator\.com|suremail\.info|spamherelots\.com|binkmail\.com|safetymail\.info)/)
  end

  def test_free_email
    email = @tester.free_email
    assert email.match(/.+@(gmail\.com|hotmail\.com|yahoo\.com|spray\.se|passagen\.se)/), "mail: #{email} does not match"
  end

  def test_login_user_name
    assert @tester.login_user_name.match(/[a-z]+((_|)[a-z]+)?/)
  end

  def test_user_name
    assert @tester.user_name.match(/[a-z]+((_|\.)[a-z]+)?/)
  end

  def test_user_name_with_arg
    assert @tester.user_name('joel larsson').match(/(joel(_|\.)larsson|larsson(_|\.)joel)/)
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

end
