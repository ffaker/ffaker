# encoding: utf-8

module FFaker
  module Color
    extend ModuleUtils
    extend self

    HEX_DIGITS = ("a".."f").to_a + (0..9).to_a

    def name
      NAMES_LIST.sample
    end

    def hex
      "##{6.times.map { HEX_DIGITS.sample }.join}"
    end
  end
end
