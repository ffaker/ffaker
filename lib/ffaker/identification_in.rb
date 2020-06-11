# frozen_string_literal: true

module FFaker
  module IdentificationIN
    extend ModuleUtils
    extend self

    AADHAAR_FORMAT = ['############'].freeze

    # REF: https://en.wikipedia.org/wiki/Aadhaar
    def aadhaar
      FFaker.numerify(AADHAAR_FORMAT)
    end
  end
end
