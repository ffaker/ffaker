# encoding: utf-8

module Faker
  module CompanyIT
    extend ModuleUtils
    extend self

    def name
      case rand(2)
      when 0 then "#{NameIT.last_name} #{suffix}"
      when 1 then "#{NameIT.last_name} e #{NameIT.last_name} #{suffix}"
      when 2 then "#{prefix} #{NameIT.last_name}"
      end
    end

    def suffix
      SUFFIXES.rand
    end

    def prefix
      PREFIXES.rand
    end

    PREFIXES = k ["Studio Legale", "Studio Tecnico", "Laboratorio"]
    SUFFIXES = k %w(S.p.a. s.r.l. s.n.c. Avvocati Architetti Ingegneri)

  end
end
