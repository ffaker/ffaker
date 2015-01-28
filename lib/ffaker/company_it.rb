# encoding: utf-8

module Faker
  module CompanyIT
    extend ModuleUtils
    extend self

    PREFIXES = ["Studio Legale", "Studio Tecnico", "Laboratorio"]
    SUFFIXES = %w(S.p.a. s.r.l. s.n.c. Avvocati Architetti Ingegneri)

    def name
      case rand(2)
      when 0 then "#{NameIT.last_name} #{suffix}"
      when 1 then "#{NameIT.last_name} e #{NameIT.last_name} #{suffix}"
      when 2 then "#{prefix} #{NameIT.last_name}"
      end
    end

    def suffix
      SUFFIXES.sample
    end

    def prefix
      PREFIXES.sample
    end
  end
end
