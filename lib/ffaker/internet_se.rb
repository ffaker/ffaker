# encoding: utf-8

module Faker
  module InternetSE
    extend ModuleUtils
    include Internet
    extend self

    def email(name = nil)
      "#{user_name(name)}@#{domain_name}"
    end

    # Returns an email address of an online disposable email service
    # (like tempinbox.com). you can really send an email to these
    # addresses an access it by going to the service web pages.
    def disposable_email(name = nil)
      "#{user_name(name)}@#{DISPOSABLE_HOSTS.rand}"
    end

    def free_email(name = nil)
      "#{user_name(name)}@#{HOSTS.rand}"
    end

    # Used to fake login names were dot is not allowed
    def login_user_name
      user_name.gsub('.','')
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
      join_char = ArrayUtils.rand(%w(. _))
      array_parts.map!(&:downcase)
      array_parts.join(join_char)
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
      DOMAIN_SUFFIXES.rand
    end

    def uri(protocol)
      "#{protocol}://#{domain_name}"
    end

    def http_url
      uri("http")
    end

    def ip_v4_address
      (1..4).map { BYTE.random_pick(1) }.join(".")
    end

    BYTE = k((0..255).to_a.map { |n| n.to_s })
    HOSTS = k %w(gmail.com yahoo.com hotmail.com spray.se passagen.se)
    DOMAIN_SUFFIXES = k %w(se nu com)
    DISPOSABLE_HOSTS = k %w(mailinator.com suremail.info spamherelots.com
                            binkmail.com safetymail.info)

  end
end
