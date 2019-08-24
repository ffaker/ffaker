# frozen_string_literal: true

module FFaker
  module PhoneNumberSN
    extend ModuleUtils
    extend self

    # Mobile Operator prefixes
    #
    #  77 =>  Orange
    #  76 =>  Tigo
    #  70 =>  Expresso
    #
    MOBILE_OPERATORS_PREFIX = %w[70 76 77].freeze

    # Home or Work Operator prefixes
    #
    #  33 =>  Orange
    #
    HOME_WORK_OPERATORS_PREFIX = %w[33].freeze

    # Return a prefix in MOBILE_OPERATORS_PREFIX
    # @see FFaker::PhoneNumberSN::MOBILE_OPERATORS_PREFIX
    #
    def mobile_phone_prefix
      fetch_sample(MOBILE_OPERATORS_PREFIX)
    end

    # Return a prefix in HOME_WORK_OPERATORS_PREFIX
    # @see FFaker::PhoneNumberSN::HOME_WORK_OPERATORS_PREFIX
    #
    def homework_phone_prefix
      fetch_sample(HOME_WORK_OPERATORS_PREFIX)
    end

    # Pattern that can be combined with a prefix to generate mobile, office phone_numbers
    # Example 745 77 99
    # Example 245 07 00
    # Example 726 29 05
    #
    def short_phone_number
      FFaker.numerify('###-##-##')
    end

    # Generates a mobile phone number
    # Example 70 745 77 99
    # Example 76 245 07 00
    # Example 77 726 29 05
    #
    def mobile_number
      "#{mobile_phone_prefix}-#{short_phone_number}"
    end

    # Generates a home or work phone number
    # Example 33 845 77 99
    # Example 33 945 07 00
    # Example 33 906 29 05
    #
    def homework_number
      "#{homework_phone_prefix}-#{rand(8..9)}#{FFaker.numerify('##-##-##')}"
    end

    # Generates a random phone number mobile or home or work
    #
    def phone_number
      return homework_number if rand(0..1).zero?

      mobile_number
    end
  end
end
