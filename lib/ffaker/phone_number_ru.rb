# frozen_string_literal: true
# encoding: utf-8

module FFaker
  #
  module PhoneNumberRU
    extend ModuleUtils
    extend self

    COUNTRY_PREFIX = %w[+7 8].freeze
    MOBILE_PREFIX = *(900..999).freeze
    PHONE_NUMBER = ['#######'].freeze
    HOME_REGION_PREFIX = %w["0 301 302 336 341 342 343 345 346 347 349 351 352
                            353 365 381 382 383 384 385 388 390 391 394 395 401
                            411 413 415 416 421 423 424 426 427 471 472 473 474
                            475 481 482 483 484 485 486 487 491 492 493 494 495
                            496 498 499 800 801 802 803 804 805 806 807 808 809
                            811 812 813 814 815 816 817 818 820 821 831 833 834
                            835 836 841 842 843 844 845 846 847 848 851 855 861
                            862 863 865 866 867 869 871 872 873 877 878 879 "].freeze
    def phone_number
      case rand(0..1)
      when 0 then home_phone_number
      when 1 then mobile_phone_number
      end
    end

    def home_phone_number
      FFaker.numerify "#{COUNTRY_PREFIX.sample}#{HOME_REGION_PREFIX.sample}#{PHONE_NUMBER.sample}"
    end

    def mobile_phone_number
      FFaker.numerify "#{COUNTRY_PREFIX.sample}#{MOBILE_PREFIX.sample}#{PHONE_NUMBER.sample}"
    end
  end
end
