# frozen_string_literal: true

module FFaker
  module IdentificationEC
    extend ModuleUtils
    extend self

    # https://medium.com/@bryansuarez/c%C3%B3mo-validar-c%C3%A9dula-y-ruc-en-ecuador-b62c5666186f
    # Cedula de Identificacion
    def ci
      first_digits = ci_digits
      "#{first_digits}#{last_digit(first_digits)}"
    end

    private

    def ci_digits
      "#{FFaker.numerify('##')}#{rand(0..5)}#{FFaker.numerify('######')}"
    end

    def last_digit(digits)
      mod = digits_sum(digits) % 10
      10 - mod if mod.positive?
    end

    def digits_sum(digits)
      sum = 0
      digits.chars.each_with_index do |char, index|
        if index.even?
          multiple = char.to_i * 2
          sum += multiple > 9 ? multiple - 9 : multiple
        else
          sum += char.to_i
        end
      end
      sum
    end
  end
end
