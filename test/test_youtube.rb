# encoding: utf-8

require 'helper'

class YoutubeTest < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(
    FFaker::Youtube,
    :url, :share_url, :embed_url, :video_id
  )

  def test_url
    assert_match(%r(www\.youtube\.com/watch\?v=\S{11}), FFaker::Youtube.url)
  end

  def test_share_url
    assert_match(%r(youtu\.be/\S{11}), FFaker::Youtube.share_url)
  end

  def test_embed_url
    assert_match(%r(www\.youtube\.com/embed/\S{11}), FFaker::Youtube.embed_url)
  end

  def test_video_id
    assert_match(/\S{11}/, FFaker::Youtube.video_id)
  end
end
