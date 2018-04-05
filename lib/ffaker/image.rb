require "tempfile"
require "open-uri"

module FFaker
  module Image
    extend ModuleUtils
    extend self

    SUPPORTED_FORMATS = %w[png jpg jpeg gif].freeze

    def url(size = "300x300", format = "png", background_color = :random, text_color = :random, text = nil)
      raise ArgumentError, "Size should be specified in format 300x300" unless size =~ /^[0-9]+x[0-9]+$/
      raise ArgumentError, "Supported formats are #{SUPPORTED_FORMATS.join(', ')}" unless SUPPORTED_FORMATS.include?(format)

      background_color = FFaker::Color.hex_code if background_color == :random
      text_color = FFaker::Color.hex_code if text_color == :random
      text = URI::encode(text.to_s)

      "https://via.placeholder.com/#{size}/#{background_color}/#{text_color}.#{format}?text=#{text}"
    end

    def file(size = "300x300", format = "png", background_color = :random, text_color = :random, text = nil)
      download_file(url(size, format, background_color, text_color, text))
    end

    private

    def download_file(url)
      file = Tempfile.new
      file.binmode
      file << Kernel.open(url).read
      file.close

      File.new(file.path)
    end
  end
end
