# encoding: utf-8

module FFaker
  module SSN
    extend ModuleUtils
    extend self

    # The Social Security number is a nine-digit number in the format
    # "AAA-GG-SSSS". More info here:
    #
    # http://en.wikipedia.org/wiki/Social_Security_number
    #
    def ssn
      FFaker.numerify('###-##-####')
    end
  end
end
