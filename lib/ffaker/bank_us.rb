# frozen_string_literal: true

module FFaker
  module BankUS
    extend ModuleUtils
    extend self

    def account_number(min_digits: 9, max_digits: 17)
      FFaker.numerify('#' * rand(min_digits..max_digits))
    end

    def routing_number
      partial_routing_number = FFaker.numerify('########')
      ninth_digit = generate_ninth_digit(partial_routing_number)

      "#{partial_routing_number}#{ninth_digit}"
    end

    private

    def generate_ninth_digit(num_string)
      # This leverages the `Modules 10, Straight Summation` used for routing_numbers
      # See http://www.sxlist.com/techref/ecommerce/bank/routingnumber/index.htm
      # for more details
      num_array = num_string.chars.map(&:to_i)
      (
        (7 * (num_array[0] + num_array[3] + num_array[6])) +
          (3 * (num_array[1] + num_array[4] + num_array[7])) +
          (9 * (num_array[2] + num_array[5]))
      ) % 10
    end
  end
end
