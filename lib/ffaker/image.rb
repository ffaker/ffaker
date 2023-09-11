# frozen_string_literal: true

require 'cgi'
require 'tempfile'
require 'open-uri'

module FFaker
  module Image
    extend ModuleUtils
    extend self

    SUPPORTED_FORMATS = %w[png jpg jpeg gif].freeze

    ## `*args` for old format support, it will be removed with deprecation
    # rubocop:disable Metrics/ParameterLists
    def url(*args, size: '300x300', format: 'png', bg_color: :random, text_color: :random, text: nil)
      if args.any?
        warn "Positional arguments for Image##{__method__} are deprecated. Please use keyword arguments."
        size = args[0]
        format = args[1] if args.size > 1
        bg_color = args[2] if args.size > 2
        text_color = args[3] if args.size > 3
        text = args[4] if args.size > 4
      end

      check_size!(size)
      check_format!(format)

      bg_color = FFaker::Color.hex_code if bg_color == :random
      text_color = FFaker::Color.hex_code if text_color == :random
      text = CGI.escape(text.to_s)

      "https://dummyimage.com/#{size}/#{bg_color}/#{text_color}.#{format}?text=#{text}"
    end
    # rubocop:enable Metrics/ParameterLists

    ## `*args` for old format support, it will be removed with deprecation
    # rubocop:disable Metrics/ParameterLists
    def file(*args, size: '300x300', format: 'png', bg_color: :random, text_color: :random, text: nil)
      if args.any?
        warn "Positional arguments for Image##{__method__} are deprecated. Please use keyword arguments."
        size = args[0]
        format = args[1] if args.size > 1
        bg_color = args[2] if args.size > 2
        text_color = args[3] if args.size > 3
        text = args[4] if args.size > 4
      end

      uri = URI.parse(url(size: size, format: format, bg_color: bg_color, text_color: text_color, text: text))
      file = Tempfile.new('ffaker_image')
      file.binmode
      file << uri.open.read
      file.close
      File.new(file.path)
    end
    # rubocop:enable Metrics/ParameterLists

    private

    def check_size!(size)
      return true if size.match?(/\A\d+x\d+\z/)

      raise ArgumentError, 'Size should be specified in format 300x300'
    end

    def check_format!(format)
      return true if SUPPORTED_FORMATS.include?(format)

      raise ArgumentError, "Supported formats are #{SUPPORTED_FORMATS.join(', ')}"
    end
  end
end
