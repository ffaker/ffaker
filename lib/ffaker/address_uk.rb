# frozen_string_literal: true

module FFaker
  module AddressUK
    include FFaker::Address

    extend ModuleUtils
    extend self

    COUNTRY = ['England', 'Scotland', 'Wales', 'Northern Ireland'].freeze

    # Valid UK postcode character sets per the UK government postcode format spec.
    # See: https://en.wikipedia.org/wiki/Postcodes_in_the_United_Kingdom#Validation

    # First area letter: Q, V and X are not used
    POSTCODE_AREA_LETTERS = (('A'..'Z').to_a - %w[Q V X]).freeze
    # Second area letter (when area has 2 letters): I, J and Z are not used
    POSTCODE_AREA_LETTERS_2 = (('A'..'Z').to_a - %w[I J Z]).freeze
    # District suffix letter for A9A format outward codes
    POSTCODE_DISTRICT_LETTERS_A9A = %w[A B C D E F G H J K P S T U W].freeze
    # District suffix letter for AA9A format outward codes
    POSTCODE_DISTRICT_LETTERS_AA9A = %w[A B E H M N P R V W X Y].freeze
    # Inward code letters: C, I, K, M, O and V are not used
    POSTCODE_INWARD_LETTERS = (('A'..'Z').to_a - %w[C I K M O V]).freeze

    def county
      fetch_sample(COUNTY)
    end

    def country
      fetch_sample(COUNTRY)
    end

    def postcode
      a1 = fetch_sample(POSTCODE_AREA_LETTERS)
      a2 = fetch_sample(POSTCODE_AREA_LETTERS_2)
      d1 = rand(0..9)
      d2 = rand(0..9)
      il = fetch_sample(POSTCODE_INWARD_LETTERS)
      il2 = fetch_sample(POSTCODE_INWARD_LETTERS)
      inward = "#{rand(0..9)}#{il}#{il2}"

      outward = case rand(0..5)
                when 0 then "#{a1}#{d1}"                                         # A9
                when 1 then "#{a1}#{d1}#{d2}"                                    # A99
                when 2 then "#{a1}#{d1}#{fetch_sample(POSTCODE_DISTRICT_LETTERS_A9A)}"  # A9A
                when 3 then "#{a1}#{a2}#{d1}"                                    # AA9
                when 4 then "#{a1}#{a2}#{d1}#{d2}"                               # AA99
                else        "#{a1}#{a2}#{d1}#{fetch_sample(POSTCODE_DISTRICT_LETTERS_AA9A)}" # AA9A
                end

      "#{outward} #{inward}"
    end
  end
end
