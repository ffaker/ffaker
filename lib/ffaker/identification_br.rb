# encoding: utf-8

module FFaker
  module IdentificationBR
    extend ModuleUtils
    extend self

    GENDERS = %w(Feminino Masculino).freeze

    def cpf
      FFaker.numerify('###########')
    end

    def pretty_cpf
      FFaker.numerify('###.###.###-##')
    end

    def rg
      FFaker.numerify('#########')
    end

    def pretty_rg
      FFaker.numerify('###.###.###')
    end

    def gender
      GENDERS.sample
    end
  end
end
