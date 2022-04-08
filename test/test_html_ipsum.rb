# frozen_string_literal: true

require_relative 'helper'

class TestHTMLIpsum < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(
    FFaker::HTMLIpsum,
    :a, :p, :dl, :ul_short, :ul_long, :ol_short, :ol_long, :ul_links,
    :table, :body, :fancy_string
  )

  def setup
    @tester = FFaker::HTMLIpsum
  end

  def test_a
    assert_match(%r{^<a href="#\w+" title="[ \w]+">[ \w]+</a>$}i, FFaker::HTMLIpsum.a)
  end

  def test_p
    # We can't predict the number of times the sentence pattern will repeat
    # because the FFaker::Lorem methods that we are using adds a random
    # number on top of what we specify for the count argument.
    assert_match(%r{^<p>([ \w]+\.)+</p>$}i, FFaker::HTMLIpsum.p)
  end

  def test_p_breaks
    # Here we can at least test how many <br> tags there are.
    assert_match(%r{^<p>(?:[ \w.]+<br>){2}[ \w.]+</p>$}i, FFaker::HTMLIpsum.p(3, include_breaks: true))
  end

  def test_p_fancy
    # We can't predict the number of times the sentence pattern will repeat
    # because the FFaker::Lorem methods that we are using adds a random
    # number on top of what we specify for the count argument. We also have to
    # account for the other HTML that is being returned.
    str = FFaker::HTMLIpsum.p(5, fancy: true)
    assert_match(/^<p>/, str)
    assert_match(%r{</p>$}, str)
    assert str.length > 6, 'string contains more than <p></p>'
  end

  def test_p_fancy_breaks
    # Here we can at least test how many <br> tags there are. We also have to
    # account for the other HTML that is being returned.
    str = FFaker::HTMLIpsum.p(10, fancy: true, include_breaks: true)
    assert_equal 10, str.split('<br>').length
  end

  def test_dl
    assert_match(%r{^<dl>(<dt>[ \w]+</dt><dd>[ \w.]+</dd>){3}</dl>$}i, FFaker::HTMLIpsum.dl(3))
  end

  def test_ul_short
    assert_match(%r{^<ul>(<li>[ \w.]+</li>){3}</ul>$}i, FFaker::HTMLIpsum.ul_short(3))
  end

  def test_ul_long
    assert_match(%r{^<ul>(<li>[ \w.]+</li>){3}</ul>$}i, FFaker::HTMLIpsum.ul_long(3))
  end

  def test_ol_short
    assert_match(%r{^<ol>(<li>[ \w.]+</li>){3}</ol>$}i, FFaker::HTMLIpsum.ol_short(3))
  end

  def test_ol_long
    assert_match(%r{^<ol>(<li>[ \w.]+</li>){3}</ol>$}i, FFaker::HTMLIpsum.ol_long(3))
  end

  def test_ul_links
    assert_match(%r{^<ul>(<li><a href="#\w+" title="\w+">[ \w]+</a></li>){3}</ul>$}i, FFaker::HTMLIpsum.ul_links(3))
  end

  def test_table
    assert_match(%r{(<td>[ \w]+</td>\s*){3}}i, FFaker::HTMLIpsum.table(3))
  end

  def test_body
    # We can't reliably predict what's going to end up inside, so just ensure
    # that we have a complete string.
    assert_match(%r{^<h1>.+</pre>$}im, FFaker::HTMLIpsum.body)
  end

  def test_fancy_string
    # We can't reliably predict what's going to end up inside, so just ensure
    # that we have a complete string.
    assert FFaker::HTMLIpsum.fancy_string.is_a?(String), 'returns a string'
    assert FFaker::HTMLIpsum.fancy_string.length > 1, 'the string is longer than one char'
  end

  def test_fancy_string_tags
    # It returns a string with at least one HTML tag
    assert_match(%r{(<.*>[\w\s]+<\/\w+>){1}}i, FFaker::HTMLIpsum.fancy_string(1))
    assert_match(%r{(<.*>[\w\s]+<\/\w+>){1}}i, FFaker::HTMLIpsum.fancy_string(3))
  end

  def test_fancy_string_breaks
    # We can't reliably predict what's going to end up inside, so just ensure
    # that we have a complete string.
    str = FFaker::HTMLIpsum.fancy_string(3, true)
    assert_equal 3, str.split('<br>').length
  end
end
