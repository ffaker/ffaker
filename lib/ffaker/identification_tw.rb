# frozen_string_literal: true

module FFaker
  module IdentificationTW
    extend ModuleUtils
    extend self

    AREA_CODE = { a: 10, b: 11, c: 12, d: 13, e: 14, f: 15, g: 16, h: 17, i: 34, j: 18, k: 19, l: 20, m: 21, n: 22,
                  o: 35, p: 23, q: 24, r: 25, s: 26, t: 27, u: 28, v: 29, w: 32, x: 30, y: 31, z: 33 }.freeze

    # Identity Card Number
    # https://en.wikipedia.org/wiki/National_identification_card_(Taiwan)#Identity_card_number
    def id
      letter = FFaker.letterify('?')
      code = AREA_CODE[letter.to_sym]
      gender = fetch_sample([1, 2])
      serial = FFaker.numerify('#######')
      a, b, c, d, e, f, g, h, i, j = "#{code}#{gender}#{serial}".chars.map(&:to_i)

      checksum = (9 * a + b + 2 * c + 3 * d + 4 * e + 5 * f + 6 * g + 7 * h + 8 * i + 9 * j) % 10
      "#{letter.upcase}#{gender}#{serial}#{checksum}"
    end
  end
end
