# encoding: utf-8

require 'ffaker/identification_es'

module Faker
  module IdentificationMX
    # Author Guapolo <github.com/guapolo>
    extend ModuleUtils
    extend self

    # http://es.wikipedia.org/wiki/Registro_Federal_de_Contribuyentes_(M%C3%A9xico)
    # Registro Federal de Contribuyentes (R.F.C.) para persona física
    def rfc_persona_fisica
      consonants_n = CONSONANTS + ["Ñ"]
      all_letters = consonants_n + VOWELS
      date = ::Time.at(rand * ::Time.now.to_f).strftime("%y%m%d")
      "#{ArrayUtils.rand(consonants_n)}#{ArrayUtils.rand(VOWELS)}#{ArrayUtils.random_pick(all_letters,2).join}#{date}#{ArrayUtils.random_pick(HOMOCLAVE,3).join}"
    end

    # http://es.wikipedia.org/wiki/Registro_Federal_de_Contribuyentes_(M%C3%A9xico)
    # Registro Federal de Contribuyentes (R.F.C.) para persona moral
    def rfc_persona_moral
      consonants_n_amp = CONSONANTS + ["Ñ", "&"]
      all_letters = consonants_n_amp + VOWELS
      date = ::Time.at(rand * ::Time.now.to_f).strftime("%y%m%d")
      "#{ArrayUtils.random_pick(all_letters,3).join}#{date}#{ArrayUtils.random_pick(HOMOCLAVE,3).join}"
    end

    # http://es.wikipedia.org/wiki/Registro_Federal_de_Contribuyentes_(M%C3%A9xico)
    # Registro Federal de Contribuyentes (R.F.C.) 
    def rfc
      ArrayUtils.rand([rfc_persona_moral, rfc_persona_fisica])
    end

    # http://es.wikipedia.org/wiki/Clave_%C3%9Anica_de_Registro_de_Poblaci%C3%B3n
    # Clave Única de Registro de Población
    def curp
      all_letters = CONSONANTS + VOWELS
      hm = ["H","M"]
      date = ::Time.at(rand * ::Time.now.to_f).strftime("%y%m%d")
      "#{ArrayUtils.rand(CONSONANTS)}#{ArrayUtils.rand(VOWELS)}#{ArrayUtils.random_pick(all_letters,2).join}#{date}#{ArrayUtils.rand(hm)}#{ArrayUtils.rand(ESTADOS_CURP)}#{ArrayUtils.random_pick(CONSONANTS,3).join}#{ArrayUtils.rand(HOMOCLAVE)}#{rand(10)}"
    end


    CONSONANTS = ["B","C","D","F","G","H","J","K","L","M","N","P","Q","R","S","T","V","W","X","Y","Z"]
    VOWELS = ["A","E","I","O","U"]
    HOMOCLAVE = CONSONANTS + VOWELS + (0..9).to_a.map{|n| n.to_s}
  end
end
