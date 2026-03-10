# frozen_string_literal: true

require_relative 'helper'

class TestFakerDevice < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(
    FFaker::Device,
    :name, :manufacturer, :platform, :version, :app_version
  )

  def test_name
    assert_match(/\A[\w\s\-\+]+\z/i, FFaker::Device.name)
  end

  def test_manufacturer
    assert_match(/\A[\w\s]+\z/i, FFaker::Device.manufacturer)
  end

  def test_platform
    assert_match(/\A[\w\s]+\z/i, FFaker::Device.platform)
  end

  def test_version
    assert_match(/\A\d+\.\d+\z/, FFaker::Device.version)
  end

  def test_app_version
    assert_match(/\A\d+\.\d+\.\d+\z/, FFaker::Device.app_version)
  end
end
