# frozen_string_literal: true

module FFaker
  # Generates random Markdown-formatted text.
  # Requires FFaker::Lorem module for text content.
  module Markdown
    extend ModuleUtils
    extend self

    HEADERS = (1..6).map { |i| '#' * i }.freeze
    EMPHASIS_MARKERS = %w[* **].freeze
    HR_MARKERS = %w[--- *** ___].freeze
    CODE_LANGUAGES = %w[ruby python javascript java go rust c cpp shell].freeze

    def header(header_level = nil)
      level = header_level ? header_level.clamp(1, 6) : rand(1..6)
      prefix = '#' * level
      "#{prefix} #{FFaker::Lorem.words(rand(2..5)).map(&:capitalize).join(' ')}"
    end

    def emphasis
      marker = fetch_sample(EMPHASIS_MARKERS)
      "#{marker}#{FFaker::Lorem.words(rand(1..3)).join(' ')}#{marker}"
    end

    def inline_code
      "`#{FFaker::Lorem.word}`"
    end

    def block_code(language = nil)
      lang = language || fetch_sample(CODE_LANGUAGES)
      lines = rand(2..6).times.map { "  #{FFaker::Lorem.words(rand(2..5)).join(' ')}" }
      "```#{lang}\n#{lines.join("\n")}\n```"
    end

    def link
      text = FFaker::Lorem.words(rand(1..3)).map(&:capitalize).join(' ')
      url = FFaker::Internet.http_url
      "[#{text}](#{url})"
    end

    def image
      alt = FFaker::Lorem.words(rand(1..3)).map(&:capitalize).join(' ')
      url = FFaker::Image.url
      "![#{alt}](#{url})"
    end

    def blockquote(sentence_count = 1)
      FFaker::Lorem.sentences(sentence_count).map { |s| "> #{s}" }.join("\n")
    end

    def ordered_list(item_count = 3)
      item_count.times.map { |i| "#{i + 1}. #{FFaker::Lorem.sentence}" }.join("\n")
    end

    def unordered_list(item_count = 3)
      item_count.times.map { "- #{FFaker::Lorem.sentence}" }.join("\n")
    end

    def table(rows = 3)
      headers = FFaker::Lorem.words(3).map(&:capitalize)
      separator = headers.map { |h| '-' * h.length }
      data_rows = rows.times.map { FFaker::Lorem.words(3).map(&:capitalize) }

      lines = []
      lines << "| #{headers.join(' | ')} |"
      lines << "| #{separator.join(' | ')} |"
      data_rows.each { |row| lines << "| #{row.join(' | ')} |" }
      lines.join("\n")
    end

    def horizontal_rule
      fetch_sample(HR_MARKERS)
    end

    def paragraph
      FFaker::Lorem.paragraph
    end
  end
end
