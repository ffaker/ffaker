# encoding: utf-8

module FFaker
  module Color
    extend ModuleUtils
    extend self

    def name
      NAMES_LIST.sample
    end

    def hex
      "##{(0..5).map { (('a'..'f').to_a + (0..9).to_a).sample }.join}"
    end
  end
end
