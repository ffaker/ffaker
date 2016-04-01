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
  end
end
