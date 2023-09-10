# frozen_string_literal: true

module FFaker
  module IdentificationMX
    extend ModuleUtils
    extend self

    CONSONANTS = %w[B C D F G H J K L M N P Q R S T V W X Y Z].freeze
    VOWELS = %w[A E I O U].freeze
    HOMOCLAVE = CONSONANTS + VOWELS + Array('0'..'9')

    # http://es.wikipedia.org/wiki/Registro_Federal_de_Contribuyentes_(M%C3%A9xico)
    # Registro Federal de Contribuyentes (R.F.C.) para persona física
    def rfc_persona_fisica
      consonants_n = CONSONANTS + ['Ñ']
      [
        fetch_sample(consonants_n),
        fetch_sample(VOWELS),
        fetch_sample(consonants_n + VOWELS, count: 2).join,
        date,
        fetch_sample(HOMOCLAVE, count: 3).join
      ].join
    end

    # http://es.wikipedia.org/wiki/Registro_Federal_de_Contribuyentes_(M%C3%A9xico)
    # Registro Federal de Contribuyentes (R.F.C.) para persona moral
    def rfc_persona_moral
      consonants_n_amp = CONSONANTS + ['Ñ', '&']
      all_letters = consonants_n_amp + VOWELS
      [fetch_sample(all_letters, count: 3), date, fetch_sample(HOMOCLAVE, count: 3)].flatten.join
    end

    # http://es.wikipedia.org/wiki/Registro_Federal_de_Contribuyentes_(M%C3%A9xico)
    # Registro Federal de Contribuyentes (R.F.C.)
    def rfc
      fetch_sample([rfc_persona_moral, rfc_persona_fisica])
    end

    # http://es.wikipedia.org/wiki/Clave_%C3%9Anica_de_Registro_de_Poblaci%C3%B3n
    # Clave Única de Registro de Población
    def curp
      all_letters = CONSONANTS + VOWELS
      hm = %w[H M]
      [
        fetch_sample(CONSONANTS), fetch_sample(VOWELS),
        fetch_sample(all_letters, count: 2).join, date, fetch_sample(hm),
        fetch_sample(ESTADOS_CURP), fetch_sample(CONSONANTS, count: 3).join,
        fetch_sample(HOMOCLAVE), rand(0..9)
      ].join
    end

    private

    def date
      ::Time.at(rand * ::Time.now.to_f).strftime('%y%m%d')
    end
  end
end
