# frozen_string_literal: true

module FFaker
  module IdentificationESCL
    extend IdentificationES
    extend ModuleUtils
    extend self

    # RUT is the Chilean ID, followed by format:  XX.XXX.XXX - Y
    # http://es.wikipedia.org/wiki/Rol_%C3%9Anico_Tributario
    #
    # The last Y is a modulo 11 validation code. In the case the result is 10, it will be
    # replaced by a 'K' character
    def rut
      # Rut is gonna be between 1.000.000 and 24.999.999
      n = rand(1_000_000...25_000_000)
      "#{n}-#{dv(n)}"
    end

    private

    def dv(rut)
      total = rut.to_s.rjust(8, '0').split(//).zip(%w[3 2 7 6 5 4 3 2]).sum do |a, b|
        a.to_i * b.to_i
      end
      (11 - total % 11).to_s.gsub(/10/, 'k').gsub(/11/, '0')
    end
  end
end
