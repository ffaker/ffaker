# frozen_string_literal: true

module FFaker
  module InternetSE
    include Internet

    extend ModuleUtils
    extend self

    BYTE = Array('0'..'255').freeze
    HOSTS = %w[gmail.com yahoo.com hotmail.com spray.se passagen.se].freeze
    DOMAIN_SUFFIXES = %w[se nu com].freeze
    DISPOSABLE_HOSTS = %w[
      mailinator.com suremail.info spamherelots.com binkmail.com safetymail.info
    ].freeze
    SLUG_DELIMITERS = %w[- _ .].freeze

    def email(name = nil)
      +"#{user_name(name)}@#{domain_name}"
    end

    # Returns an email address of an online disposable email service
    # (like tempinbox.com). you can really send an email to these
    # addresses an access it by going to the service web pages.
    def disposable_email(name = nil)
      "#{user_name(name)}@#{fetch_sample(DISPOSABLE_HOSTS)}"
    end

    def free_email(name = nil)
      "#{user_name(name)}@#{fetch_sample(HOSTS)}"
    end

    # Used to fake login names were dot is not allowed
    def login_user_name
      user_name.tr('.', '')
    end

    # Mostly used for email creation
    def user_name(name = nil)
      return user_name_from_name(name) if name

      user_name_random
    end

    def user_name_random
      rand(0..1).zero? ? user_name_variant_short : user_name_variant_long
    end

    def user_name_variant_long
      array_parts = [NameSE.first_name, NameSE.last_name]
      array_parts.map! { |word| word.gsub(/\W/, '') }
      join_to_user_name(array_parts)
    end

    def user_name_variant_short
      array_parts = [NameSE.first_name]
      array_parts.map! { |word| word.gsub(/\W/, '') }
      join_to_user_name(array_parts)
    end

    def user_name_from_name(name)
      array_parts = shuffle(name.scan(/\w+/))
      join_to_user_name(array_parts)
    end

    def join_to_user_name(array_parts)
      join_char = fetch_sample(%w[. _])
      array_parts.map(&:downcase).join(join_char)
    end

    def domain_name
      "#{domain_word}.#{domain_suffix}"
    end

    def domain_word
      company_name_single_word.tap do |dw|
        dw.gsub!(/\W/, '')
        dw.downcase!
      end
    end

    def company_name_single_word
      CompanySE.name.split(' ').first
    end

    def domain_suffix
      fetch_sample(DOMAIN_SUFFIXES)
    end

    def uri(protocol)
      "#{protocol}://#{domain_name}"
    end

    def http_url
      uri('http')
    end

    def ip_v4_address
      (1..4).map { fetch_sample(BYTE) }.join('.')
    end

    def slug(words = nil, glue = nil)
      glue ||= fetch_sample(SLUG_DELIMITERS)

      (words || FFaker::Lorem.words(2).join(' ')).gsub(' ', glue).downcase
    end
  end
end
