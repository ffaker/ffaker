require 'helper'

class TestHTMLIpsum < Test::Unit::TestCase
  def setup
    @tester = Faker::HTMLIpsum
  end

  def test_a
    assert_match /^<a href="#\w+" title="[ \w]+">[ \w]+<\/a>$/i, Faker::HTMLIpsum.a
  end

  def test_p_long
    assert_match /^<p>([ \w.]|<br>)+<\/p>$/i, Faker::HTMLIpsum.p_long
  end
  
  def test_p_medium
    assert_match /^<p>([ \w.]|<br>)+<\/p>$/i, Faker::HTMLIpsum.p_medium
  end
  
  def test_p
    assert_match /^<p>([ \w.]|<br>)+<\/p>$/i, Faker::HTMLIpsum.p
  end
  
  def test_dl
    assert_match /^<dl>(<dt>[ \w]+<\/dt><dd>[ \w.]+<\/dd>){3}<\/dl>$/i, Faker::HTMLIpsum.dl(3)
  end
  
  def test_ul_short
    assert_match /^<ul>(<li>[ \w.]+<\/li>){3}<\/ul>$/i, Faker::HTMLIpsum.ul_short(3)
  end
  
  def test_ul_long
    assert_match /^<ul>(<li>[ \w.]+<\/li>){3}<\/ul>$/i, Faker::HTMLIpsum.ul_long(3)
  end

  def test_ol_short
    assert_match /^<ol>(<li>[ \w.]+<\/li>){3}<\/ol>$/i, Faker::HTMLIpsum.ol_short(3)
  end
  
  def test_ol_long
    assert_match /^<ol>(<li>[ \w.]+<\/li>){3}<\/ol>$/i, Faker::HTMLIpsum.ol_long(3)
  end
  
  def test_ul_links
    assert_match /^<ul>(<li><a href="#\w+" title="\w+">[ \w]+<\/a><\/li>){3}<\/ul>$/i, Faker::HTMLIpsum.ul_links(3)
  end
  
  def test_table
    assert_match /(<td>[ \w]+<\/td>\s*){3}/i, Faker::HTMLIpsum.table(3)
  end
  
  def test_body
    assert_match /^<h1>.+<\/pre>+$/im, Faker::HTMLIpsum.body
  end
end
