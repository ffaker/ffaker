# encoding: utf-8

module FFaker
  module Avatar
    extend ModuleUtils
    extend self

    SUPPORTED_FORMATS = %w[png jpg bmp].freeze

    def image(slug = nil, size = '300x300', format = 'png', bgset = nil)
      raise ArgumentError, 'Size should be specified in format 300x300' unless size =~ /^[0-9]+x[0-9]+$/
      raise ArgumentError, "Supported formats are #{SUPPORTED_FORMATS.join(', ')}" unless SUPPORTED_FORMATS.include?(format)
      raise ArgumentError, 'Not a supported background number. Choose eather 1 or 2' unless bgset.nil? || (1..2).cover?(bgset.to_i)
      slug ||= FFaker::Lorem.words.join
      "https://robohash.org/#{slug}.#{format}?size=#{size}#{'&bgset=bg' + bgset.to_s unless bgset.nil?}"
    end
  end
end
