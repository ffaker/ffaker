# frozen_string_literal: true

module FFaker
  module Avatar
    extend ModuleUtils
    extend self

    SUPPORTED_FORMATS = %w[png jpg bmp].freeze

    def image(*args, slug: nil, size: '300x300', format: 'png', bgset: nil)
      if args.any?
        warn "Positional arguments for Avatar##{__method__} are deprecated. Please use keyword arguments."
        slug = args[0]
        size = args[1] if args.size > 1
        format = args[2] if args.size > 2
        bgset = args[3] if args.size > 3
      end

      check_passed_params(size, format, bgset)
      slug ||= FFaker::Lorem.words.join
      "https://robohash.org/#{slug}.#{format}?size=#{size}#{"&bgset=bg#{bgset}" if bgset}"
    end

    private

    def check_passed_params(size, format, bgset)
      invalid_size_error unless size.match?(/^[0-9]+x[0-9]+$/)
      invalid_format_error unless SUPPORTED_FORMATS.include?(format)
      invalid_background_number unless bgset.nil? || (1..2).cover?(bgset.to_i)
    end

    def invalid_size_error
      raise ArgumentError, 'Size should be specified in format 300x300'
    end

    def invalid_format_error
      raise ArgumentError, "Supported formats are #{SUPPORTED_FORMATS.join(', ')}"
    end

    def invalid_background_number
      raise ArgumentError, 'Not a supported background number. Choose eather 1 or 2'
    end
  end
end
