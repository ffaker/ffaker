# frozen_string_literal: true

require_relative 'helper'

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
    assert_match(/@\S*/, FFaker::Tweet.mention)
  end

  def test_mentions_three
    assert_match(/@\S*\s@\S*\s@\S*/, FFaker::Tweet.mentions(3))
    assert_deterministic { FFaker::Tweet.mentions(3) }
  end

  def test_body
    assert_less_than_or_equal_to FFaker::Tweet.body.size, 140
  end

  def test_shortish_body
    assert_less_than_or_equal_to FFaker::Tweet.body(20).size, 20
  end

  def test_short_body
    assert_between(FFaker::Tweet.body(2).size, 2..20)
  end

  def test_tweet
    assert_random_less_than_or_equal_to(140) { FFaker::Tweet.tweet.size }
  end

  def test_tweet_with_reply
    assert_match(/^@/, FFaker::Tweet.tweet(reply: true))
    assert_deterministic { FFaker::Tweet.tweet(reply: true) }
  end

  def test_oversize_body_length
    assert_less_than_or_equal_to FFaker::Tweet.tweet(body_length: 200).size, 140
  end

  def test_undersize_body_length
    assert_less_than_or_equal_to FFaker::Tweet.tweet(body_length: 2).size, 140
  end
end
