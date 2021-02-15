# frozen_string_literal: true

require 'cgi'
require 'tempfile'
require 'open-uri'

module FFaker
  module Image
    extend ModuleUtils
    extend self

    SUPPORTED_FORMATS = %w[png jpg jpeg gif].freeze

    def url(size = '300x300', format = 'png', bg_color = :random, text_color = :random, text = nil)
      check_size!(size)
      check_format!(format)

      bg_color = FFaker::Color.hex_code if bg_color == :random
      text_color = FFaker::Color.hex_code if text_color == :random
      text = CGI.escape(text.to_s)

      "https://dummyimage.com/#{size}/#{bg_color}/#{text_color}.#{format}?text=#{text}"
    end

    def file(size = '300x300', format = 'png', bg_color = :random, text_color = :random, text = nil)
      uri = URI.parse(url(size, format, bg_color, text_color, text))
      file = Tempfile.new('ffaker_image')
      file.binmode
      file << uri.open.read
      file.close
      File.new(file.path)
    end

    private

    def check_size!(size)
      return true if size =~ /\A\d+x\d+\z/

      raise ArgumentError, 'Size should be specified in format 300x300'
    end

    def check_format!(format)
      return true if SUPPORTED_FORMATS.include?(format)

      raise ArgumentError, "Supported formats are #{SUPPORTED_FORMATS.join(', ')}"
    end
  end
end
