# encoding: utf-8

require 'ffaker/internet'

module Faker
  module InternetSE
    include Internet

    extend ModuleUtils
    extend self

    BYTE = [*'0'..'255']
    HOSTS = %w(gmail.com yahoo.com hotmail.com spray.se passagen.se)
    DOMAIN_SUFFIXES = %w(se nu com)
    DISPOSABLE_HOSTS = %w(mailinator.com suremail.info spamherelots.com binkmail.com safetymail.info)
    SLUG_DELIMITERS = %w[- _ .]

    def email(name = nil)
      "#{user_name(name)}@#{domain_name}"
    end

    # Returns an email address of an online disposable email service
    # (like tempinbox.com). you can really send an email to these
    # addresses an access it by going to the service web pages.
    def disposable_email(name = nil)
      "#{user_name(name)}@#{DISPOSABLE_HOSTS.sample}"
    end

    def free_email(name = nil)
      "#{user_name(name)}@#{HOSTS.sample}"
    end

    # Used to fake login names were dot is not allowed
    def login_user_name
      user_name.tr('.','')
    end

    # Mostly used for email creation
    def user_name(name = nil)
      return user_name_from_name(name) if name
      user_name_random
    end

    def user_name_random
      variant = rand(2)
      case variant
      when 0 then user_name_variant_short
      when 1 then user_name_variant_long
      else        user_name_variant_short
      end
    end

    def user_name_variant_long
      array_parts = [ NameSE.first_name, NameSE.last_name ]
      array_parts.map!{ |word| word.gsub(/\W/, '') }
      join_to_user_name(array_parts)
    end

    def user_name_variant_short
      array_parts = [ NameSE.first_name ]
      array_parts.map!{ |word| word.gsub(/\W/, '') }
      join_to_user_name(array_parts)
    end

    def user_name_from_name(name)
      array_parts = ArrayUtils.shuffle(name.scan(/\w+/))
      join_to_user_name(array_parts)
    end

    def join_to_user_name(array_parts)
      join_char = %w(. _).sample
      array_parts.map(&:downcase).join(join_char)
    end

    def domain_name
      "#{domain_word}.#{domain_suffix}"
    end

    def domain_word
      company_name_single_word.tap { |dw|
        dw.gsub!(/\W/, '')
        dw.downcase!
      }
    end

    def company_name_single_word
      CompanySE.name.split(' ').first
    end

    def domain_suffix
      DOMAIN_SUFFIXES.sample
    end

    def uri(protocol)
      "#{protocol}://#{domain_name}"
    end

    def http_url
      uri("http")
    end

    def ip_v4_address
      (1..4).map { BYTE.sample }.join(".")
    end

    def slug(words = nil, glue = nil)
      glue ||= SLUG_DELIMITERS.sample

      (words || Faker::Lorem::words(2).join(' ')).gsub(' ', glue).downcase
    end
  end
end
