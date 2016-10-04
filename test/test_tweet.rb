# encoding: utf-8

require 'helper'

class TestTweet < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(
    FFaker::Tweet,
    :tags, :mention, :body, :tweet
  )

  def test_2_tags
    assert_match(/\#\S*\s\#\S*/, FFaker::Tweet.tags)
  end

  def test_3_tags
    assert_match(/\#\S*\s\#\S*\s\#\S*/, FFaker::Tweet.tags(3))
    assert_deterministic { FFaker::Tweet.tags(3) }
  end

  def test_mention
    assert_match(/\@\S*/, FFaker::Tweet.mention)
  end

  def test_mentions_three
    assert_match(/\@\S*\s\@\S*\s\@\S*/, FFaker::Tweet.mentions(3))
    assert_deterministic { FFaker::Tweet.mentions(3) }
  end

  def test_body
    assert(FFaker::Tweet.body.size <= 140)
  end

  def test_shortish_body
    assert(FFaker::Tweet.body(20).size <= 20)
  end

  def test_short_body
    assert(FFaker::Tweet.body(2).size.between?(2, 20))
  end

  def test_tweet
    100.times { assert(FFaker::Tweet.tweet.size <= 140) }
  end

  def test_tweet_with_reply
    assert_match(/^\@/, FFaker::Tweet.tweet(reply: true))
    assert_deterministic { FFaker::Tweet.tweet(reply: true) }
  end

  def test_oversize_body_length
    assert(FFaker::Tweet.tweet(body_length: 200).size <= 140)
  end

  def test_undersize_body_length
    assert(FFaker::Tweet.tweet(body_length: 2).size <= 140)
  end
end
