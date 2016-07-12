# encoding: utf-8

module FFaker
  module Color
    extend ModuleUtils
    extend self

    def name
      NAMES_LIST.sample
    end

    def hex_code
      format('%06x', rand * 0xffffff)
    end

    def rgb_array
      [random_rgb_value, random_rgb_value, random_rgb_value]
    end

    def rgb_list
      "#{random_rgb_value},#{random_rgb_value},#{random_rgb_value}"
    end

    private

    def random_rgb_value
      rand 255
    end
  end
end
