# encoding: utf-8

module FFaker
  module Color
    extend ModuleUtils
    extend self

    def name
      fetch(NAMES_LIST)
    end

    def hex_code
      format('%06x', rand * 0xffffff)
    end
  end
end
