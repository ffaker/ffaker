# frozen_string_literal: true

module FFaker
  module IdentificationKr
    extend ModuleUtils
    extend self

    # Resident Registration Number
    # http://ko.wikipedia.org/wiki/%EC%A3%BC%EB%AF%BC%EB%93%B1%EB%A1%9D%EB%B2%88%ED%98%B8
    def rrn
      birth = fetch_sample(Date.new(1970, 1, 1)..Date.new(1999, 12, 31)).strftime('%y%d%m')
      sex = fetch_sample([1, 2])
      loc = FFaker.numerify("#{fetch_sample(Array('00'..'95'))}###")
      a, b, c, d, e, f, g, h, i, j, k, l = "#{birth}#{sex}#{loc}".split(//).map(&:to_i)
      checksum = (11 - (2 * a + 3 * b + 4 * c + 5 * d + 6 * e + 7 * f + 8 * g + 9 * h + 2 * i + 3 * j + 4 * k + 5 * l) % 11) % 10
      "#{birth}-#{sex}#{loc}#{checksum}"
    end
  end
end
