# frozen_string_literal: true

module FFaker
  module Color
    extend ModuleUtils
    extend self

    def name
      fetch_sample(NAMES_LIST)
    end

    def hex_code
      format('%06x', rand * 0xffffff)
    end

    def rgb_array
      [random_rgb_value, random_rgb_value, random_rgb_value]
    end

    def rgb_list
      rgb_array.join(',')
    end

    def rgba_array
      rgb_array << random_opacity_value
    end

    def rgba_list
      rgba_array.join(',')
    end

    def hsl_array
      [random_hue_value, random_percentage_string, random_percentage_string]
    end

    def hsl_list
      hsl_array.join(',')
    end

    def hsla_array
      hsl_array << random_opacity_value
    end

    def hsla_list
      hsla_array.join(',')
    end

    private

    def random_rgb_value
      rand 255
    end

    def random_opacity_value
      rand(0.0..1.0).round(2)
    end

    def random_hue_value
      rand(0..359)
    end

    def random_percentage_string
      "#{rand(0..99)}%"
    end
  end
end
