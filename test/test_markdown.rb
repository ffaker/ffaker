# frozen_string_literal: true

require_relative 'helper'

class TestMarkdown < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(
    FFaker::Markdown,
    :header, :emphasis, :inline_code, :block_code, :link, :image,
    :blockquote, :ordered_list, :unordered_list, :table, :horizontal_rule, :paragraph
  )

  def test_header
    result = FFaker::Markdown.header
    assert_match(/\A#{Regexp.quote('#')}+\s\S/, result)
    assert_match(/\A#{Regexp.quote('#')}{1,6}\s/, result)
  end

  def test_header_with_level
    (1..6).each do |level|
      result = FFaker::Markdown.header(level)
      assert_match(/\A#{'#' * level} /, result)
    end
  end

  def test_header_clamps_level
    assert_match(/\A# /, FFaker::Markdown.header(0))
    assert_match(/\A###### /, FFaker::Markdown.header(7))
  end

  def test_emphasis
    result = FFaker::Markdown.emphasis
    assert_match(/\A(\*\*|\*).+(\*\*|\*)\z/, result)
  end

  def test_inline_code
    result = FFaker::Markdown.inline_code
    assert_match(/\A`\w+`\z/, result)
  end

  def test_block_code
    result = FFaker::Markdown.block_code
    assert_match(/\A```\w+\n.+\n```\z/m, result)
  end

  def test_block_code_with_language
    result = FFaker::Markdown.block_code('ruby')
    assert_match(/\A```ruby\n/, result)
  end

  def test_link
    result = FFaker::Markdown.link
    assert_match(%r{\A\[.+\]\(http://.+\)\z}, result)
  end

  def test_image
    result = FFaker::Markdown.image
    assert_match(%r{\A!\[.+\]\(https?://.+\)\z}, result)
  end

  def test_blockquote
    result = FFaker::Markdown.blockquote
    assert_match(/\A> /, result)
  end

  def test_blockquote_multiple_sentences
    result = FFaker::Markdown.blockquote(3)
    lines = result.split("\n")
    assert_equal 3, lines.length
    lines.each { |line| assert_match(/\A> /, line) }
  end

  def test_ordered_list
    result = FFaker::Markdown.ordered_list
    lines = result.split("\n")
    assert_equal 3, lines.length
    lines.each_with_index { |line, i| assert_match(/\A#{i + 1}\. /, line) }
  end

  def test_ordered_list_custom_count
    result = FFaker::Markdown.ordered_list(5)
    assert_equal 5, result.split("\n").length
  end

  def test_unordered_list
    result = FFaker::Markdown.unordered_list
    lines = result.split("\n")
    assert_equal 3, lines.length
    lines.each { |line| assert_match(/\A- /, line) }
  end

  def test_unordered_list_custom_count
    result = FFaker::Markdown.unordered_list(4)
    assert_equal 4, result.split("\n").length
  end

  def test_table
    result = FFaker::Markdown.table
    lines = result.split("\n")
    assert lines.length >= 5, 'table has header, separator, and 3 data rows'
    assert_match(/\A\|/, lines[0])
    assert_match(/\A\|[-| ]+\|\z/, lines[1])
  end

  def test_horizontal_rule
    result = FFaker::Markdown.horizontal_rule
    assert_includes %w[--- *** ___], result
  end

  def test_paragraph
    result = FFaker::Markdown.paragraph
    assert result.is_a?(String)
    assert result.length > 1
  end
end
