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

    # All 6 valid UK outward code format generators (lambdas receive area/district digits and letters)
    POSTCODE_OUTWARD_FORMATS = [
      ->(a1, _a2, d1, _d2, _dl) { "#{a1}#{d1}" },                    # A9
      ->(a1, _a2, d1, d2, _dl)  { "#{a1}#{d1}#{d2}" },               # A99
      ->(a1, _a2, d1, _d2, dl)  { "#{a1}#{d1}#{dl}" },               # A9A
      ->(a1, a2, d1, _d2, _dl)  { "#{a1}#{a2}#{d1}" },               # AA9
      ->(a1, a2, d1, d2, _dl)   { "#{a1}#{a2}#{d1}#{d2}" },          # AA99
      ->(a1, a2, d1, _d2, dl)   { "#{a1}#{a2}#{d1}#{dl}" }           # AA9A
    ].freeze

    def postcode
      a1 = fetch_sample(POSTCODE_AREA_LETTERS)
      a2 = fetch_sample(POSTCODE_AREA_LETTERS_2)
      d1 = rand(0..9)
      d2 = rand(0..9)
      id = rand(0..9)

      format = fetch_sample(POSTCODE_OUTWARD_FORMATS)
      # District letter depends on format: A9A uses POSTCODE_DISTRICT_LETTERS_A9A,
      # AA9A uses POSTCODE_DISTRICT_LETTERS_AA9A. We pass from DISTRICT_LETTERS_AA9A
      # as default; it is ignored for non-district-letter formats.
      dl = if format == POSTCODE_OUTWARD_FORMATS[2]
             fetch_sample(POSTCODE_DISTRICT_LETTERS_A9A)
           else
             fetch_sample(POSTCODE_DISTRICT_LETTERS_AA9A)
           end

      outward = format.call(a1, a2, d1, d2, dl)
      inward = "#{id}#{fetch_sample(POSTCODE_INWARD_LETTERS)}#{fetch_sample(POSTCODE_INWARD_LETTERS)}"

      "#{outward} #{inward}"
    end
  end
end
