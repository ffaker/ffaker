# encoding: utf-8

module FFaker
  module PhoneNumberNL
    extend ModuleUtils
    extend self

    COUNTRY_CODE = '+31'.freeze
    AREA_CODE_PREFIX = '0'.freeze
    PHONE_NUMBER = {
      2 => ['#######', '### ####', '#### ###'],
      3 => ['######', '#### ##', '## ## ##']
    }.freeze
    AREA_CODES = %w[10 111 113 114 115 117 118 13 14 15 161 162 164 165 166 167 168 172 174 180 181 182 183 184 186 187 20 222 223 224 226 227 228 229 23 24 251 252 255 26 294 297 299 30 313 314 315 316 317 318 320 321 33 341 342 343 344 345 346 347 348 35 36 38 40 411 412 413 416 418 43 45 46 475 478 481 485 486 487 488 492 493 495 497 499 50 511 512 513 514 515 516 517 518 519 521 522 523 524 525 527 528 529 53 541 543 544 545 546 547 548 55 561 562 566 570 571 572 573 575 577 578 58 591 592 593 594 595 596 597 598 599 70 71 72 73 74 75 76 77 78 79].freeze
    MOBILE_PHONE_NUMBER = ['########', ' ## ## ## ##', ' ### ### ##', ' #### ####'].freeze

    def phone_number
      case rand(0..1)
      when 0 then home_work_phone_number
      when 1 then mobile_phone_number
      end
    end

    def home_work_phone_number
      area = fetch_sample(AREA_CODES)
      FFaker.numerify "#{AREA_CODE_PREFIX}#{area}-#{fetch_sample(PHONE_NUMBER[area.size])}"
    end

    def mobile_phone_number
      FFaker.numerify "#{AREA_CODE_PREFIX}6#{fetch_sample(MOBILE_PHONE_NUMBER)}"
    end

    def international_phone_number
      case rand(0..1)
      when 0 then international_mobile_phone_number
      when 1 then international_home_work_phone_number
      end
    end

    def international_home_work_phone_number
      area = fetch_sample(AREA_CODES)
      FFaker.numerify("#{COUNTRY_CODE} #{area}-#{fetch_sample(PHONE_NUMBER[area.size])}")
    end

    def international_mobile_phone_number
      FFaker.numerify("#{COUNTRY_CODE} 6#{fetch_sample(MOBILE_PHONE_NUMBER)}")
    end
  end
end
