# frozen_string_literal: true

module FFaker
  module IdentificationBR
    extend ModuleUtils
    extend self

    GENDERS = %w[Feminino Masculino].freeze
    CPF_VERIFICATION_MULTIPLIERS = [11, 10, 9, 8, 7, 6, 5, 4, 3, 2].freeze
    CNPJ_VERIFICATION_MULTIPLIERS = [6, 5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2].freeze

    def cpf
      cpf = FFaker.numerify('#########')
      validators = cpf_verification_digits(cpf)
      cpf + validators.join
    end

    def pretty_cpf
      cpf_numbers = cpf
      format('%s.%s.%s-%s',
             cpf_numbers[0..2],
             cpf_numbers[3..5],
             cpf_numbers[6..8],
             cpf_numbers[9..10])
    end

    def cnpj
      cnpj = FFaker.numerify('############')
      validators = cnpj_verification_digits(cnpj)
      cnpj + validators.join
    end

    def pretty_cnpj
      cnpj_numbers = cnpj.to_s.rjust(14, '0')
      format('%s.%s.%s/%s-%s',
             cnpj_numbers[0..1],
             cnpj_numbers[2..4],
             cnpj_numbers[5..7],
             cnpj_numbers[8..11],
             cnpj_numbers[12..14])
    end

    def rg
      FFaker.numerify('#########')
    end

    def pretty_rg
      FFaker.numerify('###.###.###')
    end

    def gender
      fetch_sample(GENDERS)
    end

    def cpf_verification_digits(cpf)
      document_verification_digits(CPF_VERIFICATION_MULTIPLIERS, cpf)
    end

    def cnpj_verification_digits(cnpj)
      document_verification_digits(CNPJ_VERIFICATION_MULTIPLIERS, cnpj)
    end

    private

    def document_verification_digits(verification_multipliers, document = nil)
      return false if document.nil?

      document_digits = document.to_s.scan(/[0-9]/).map(&:to_i)
      validation_digits = []

      if document_digits.size + 1 == verification_multipliers.size && document_digits.uniq.size > 1
        0.upto(1) do |i|
          sum = verification_multipliers.drop(1 - i).each_with_index.inject(0) do |val, (value, j)|
            val + document_digits[j] * value
          end
          validation_digits[i] = (sum %= 11) < 2 ? 0 : 11 - sum
          document_digits.push(validation_digits[i])
        end
        return validation_digits
      end
      []
    end
  end
end
