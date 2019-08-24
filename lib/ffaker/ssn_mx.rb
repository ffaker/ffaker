# frozen_string_literal: true

module FFaker
  module SSNMX
    extend ModuleUtils
    extend self

    # The Social Security number is a eleven-digit number in the format
    # "AABBCCDDEE-F".
    def ssn
      FFaker.numerify('##########-#')
    end

    # The Social Security number is a eleven-digit number in the format
    # "AABBCCDDEEF".
    def ssn_undashed
      FFaker.numerify('###########')
    end

    # http://es.wikipedia.org/wiki/Instituto_Mexicano_del_Seguro_Social
    # The Social Security number from IMSS
    # (Instituto Mexicano del Seguro Social)
    # is a eleven-digit number in the format
    # "AABBCCDDEE-F".
    def imss
      FFaker.numerify('##########-#')
    end

    # http://es.wikipedia.org/wiki/Instituto_Mexicano_del_Seguro_Social
    # The Social Security number from IMSS
    # (Instituto Mexicano del Seguro Social)
    # is a eleven-digit number in the format
    # "AABBCCDDEEF".
    def imss_undashed
      FFaker.numerify('###########')
    end

    # http://es.wikipedia.org/wiki/Instituto_de_Seguridad_y_Servicios_Sociales_de_los_Trabajadores_del_Estado
    # The Social Security number from ISSSTE
    # (Instituto de Seguridad y Servicios Sociales de los Trabajadores del Estado)
    # is a eleven-digit number in the format
    # "AABBCCDDEE-F".
    def issste
      FFaker.numerify('##########-#')
    end

    # http://es.wikipedia.org/wiki/Instituto_de_Seguridad_y_Servicios_Sociales_de_los_Trabajadores_del_Estado
    # The Social Security number from ISSSTE
    # (Instituto de Seguridad y Servicios Sociales de los Trabajadores del Estado)
    # is a eleven-digit number in the format
    # "AABBCCDDEEF".
    def issste_undashed
      FFaker.numerify('###########')
    end
  end
end
