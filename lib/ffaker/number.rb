# frozen_string_literal: true

module FFaker
  module Number
    extend ModuleUtils
    extend self

    def number(digits: 1)
      FFaker.numerify(generate_pattern(digits)).to_i
    end

    def decimal(whole_digits: 1, fractional_digits: 1)
      whole_part_pattern = generate_pattern(whole_digits)
      fractional_part_pattern = generate_pattern(fractional_digits).reverse
      FFaker.numerify("#{whole_part_pattern}.#{fractional_part_pattern}").to_f
    end

    private

    def generate_pattern(digits)
      raise ArgumentError.new('Digits cannot be less than 1') if digits < 1

      "#{fetch_sample(1..9)}#{"#" * (digits - 1)}"
    end
  end
end
