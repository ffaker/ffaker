## 2.7.0
  - Add unique method [@AlexAvlonitis]
  - Add Time.day_of_week [@tvarley]
  - Add CompanyIT.partita_iva [@aaronsama]

## 2.6.0
  - Add Polish names [@walerian777]
  - Add Polish addresses [@walerian777]
  - Add full_address to Brazilian addresses [@adimircolen]
  - Add Filesystem [@j0al]
  - Add Aminal [@ni3t]
  - Fix PhoneNumberAU mobile number [@spheric]

## 2.5.0
  - Support Arabic names [@Moafak]
  - Add Japanese address [@kojino]
  - Add more Brazilian city [@jasonleonhard]
  - Now PhoneNumber#ime returns valid IMEIs [@metalelf0]

## 2.4.0
  - Support Indonesia names, address, phone & gender [@brain64bit]
  - Support Russian lorem [@mechos3d]
  - Fix AddressAU#time_zone: will return AU time zone now [@tatey]

## 2.3.0
  - Make deterministic / repeatedly random using seed [@xunker]
  - Fix DE and NL address modules [@dankimio]
  - Refactor HTMLIpsum module [@rocknruby]
  - Stricter exchange code in US phone number [@MQuy]
  - Add AWS module [@joshdvir]
  - Add hexcode to Color module [@thutterer]
  - Add CPF/CPFJ to Brazilian identification module [@thutterer]
  - Add MAC address to Internet module [@pawelma]
  - Add rgb, rgba, hsl, hsla to Color module [@dphurley]
  - Add html safe names to Name module [@dimroc]
  - Add mode education degrees to Education module [@dimroc]
  - Add datetime to Time module [@waldyr]
  - Add between to Time module [@brnrdog]
  - Add Airline module [@jakubm]
  - Add Sport module [@iamarmanjon]
  - Add Youtube module [@andyklimczak]
  - Add Tweet module [@tvarley]
  - Add Korean address module [@marocchino]
  - Add Greek name module [@falegk]
  - Add Greek address module [@falegk]
  - Add Brazilian name module [@Sephyros]
  - Add Vietnam job module [@vinhnglx]
  - Add Chinese company module [@robin]
  - Add Thai name module [@firedev]
  - Add Japanese lolem module [@44uk]
  - Add Book module [@max-si-m]
  - Add gender option to Brazilian name module [@IgorMarques]
  - Add Brazilian gender module [@IgorMarques]
  - Add gender option to English name module [@nav16]
  - Add Brazilian identification module [@IgorMarques]
  - Add Brazilian job module [@IgorMarques]
  - Add Cambodian name module [@Phanithism]

## 2.2.0
  - fixes some bugs
    - generating Robohash images

  - many new improvements and enhancements like:
    - CheesyLingo
    - Music module
    - Brazilian phones
    - Improve NameJA
    - added AddressRU

## 2.1.0

  - [#191] - add REFERENCE.md ([@rstacruz])
  - [#193] - fix FFaker::Locale.language throwing errors ([@rstacruz], [#196])
  - [#199] - FFaker::String.from_regexp: implement support for regexp ranges like `/[a-f]/` ([@marocchino], [#200])
  - [#181] - fix FFaker::PhoneNumber.phone_number throwing invalid US phone numbers ([@rstacruz], [#195])
  - [#181] - implement FFaker::PhoneNumber.area_code ([@rstacruz], [#195])
  - [#203] - deprecate FFaker::ArrayUtils.random_pick in favor for Array#sample ([@marocchino])
  - [#211] - add Korean identification support
  - [#212] - add IMEI support
  - [#213] - Fix max length support FFaker::Internet.password ([@anderscarling])
  - many internal library and test suite refactorings


[#181]: https://github.com/ffaker/ffaker/issues/181
[#191]: https://github.com/ffaker/ffaker/issues/191
[#193]: https://github.com/ffaker/ffaker/issues/193
[#195]: https://github.com/ffaker/ffaker/issues/195
[#196]: https://github.com/ffaker/ffaker/issues/196
[#199]: https://github.com/ffaker/ffaker/issues/199
[#200]: https://github.com/ffaker/ffaker/issues/200
[#203]: https://github.com/ffaker/ffaker/issues/203
[#211]: https://github.com/ffaker/ffaker/pull/211
[#212]: https://github.com/ffaker/ffaker/pull/212
[#213]: https://github.com/ffaker/ffaker/pull/213
[@marocchino]: https://github.com/marocchino
[@rstacruz]: https://github.com/rstacruz
[@anderscarling]: https://github.com/anderscarling


## 2.0.0
  - switched faker to ffaker namespace, you should now be able to use
  faker and ffaker gem together.

## 1.32.1
  - set required ruby version for gem

## 1.32.0
  - add Korean lorem to API
  - add 100 canadian largest cities to API
  - add Cuban phone numbers to API
  - add currency code to API
  - internal code-style improvements

## 1.31.0

  - add deprecation warning to ArrayUtils#rand method
  - changed all internal ArrayUtils#rand method calls to Array#sample
  - Korea API additions
  - fixes some broken tests


## 1.30.0

  - dropped support for ruby 1.8.x
  - fixes some broken tests
  - improved Faker::Internet.slug method
  - added Faker::Gender(CN), Faker::Guid to API
  - added continental_state and continental_state_abbr to Faker::AddressUs API
  - added Faker::Internet.safe_email method to API
  - added max_length parameter to Faker::Internet.password
  - and some small API additions ... for more details check the git log

## 1.25.0

API additions and some fixes... check the git log! :)

## 1.24.0

API additions

## 1.23.0

API additions

## 1.22.1

Bugfixes and minor API additions.

## 1.22.1

Bugfixes

## 1.22.0

Maintenance release, lots of cleanups.
New modules contributed.

## 1.21.0

NameFR

Skill

Unit

UnitEnglish

UnitMetric

## 1.20.0

JobFR

LoremFR

## 1.19.0
More APIs

## 1.16.2
Small bug fix and updated docs.

## 1.16.1
Fixes for ruby 1.8.x

## 1.16.0
Many module additions from different contributors!

## 1.15.0
NameKR (https://github.com/ffaker/ffaker/pull/47) and PhoneNumbersSG
(https://github.com/ffaker/ffaker/pull/46).

## 1.14.0

AddressSN (thanks PapePathe), and a bugfix on FFaker::Product.model (thanks finarfin).

## 1.13.0

Education bug fix, FFaker::Job (thanks Piotr Usewicz)

## 1.12.0

FFaker::AddressAU and FakkerAddressPhoneAU modules (thanks Ben Wiseley).

## 1.11.0

Extraction of AddressUK and AddressUS classes. (Thanks doctorbh).

## 1.10.1

FFaker::AddressCA (Thanks doctorbh, https://github.com/ffaker/ffaker/pull/27)

## 1.9.1

FFaker::NameSN, FFaker::PhoneNumberSN (Thanks SENE, https://github.com/ffaker/ffaker/pull/26)

Added FFaker::NameJA (Thanks kichiro, https://github.com/ffaker/ffaker/pull/21)

## 1.8.1

Remove a warning.

## 1.8.0

FFaker::HTMLIpsum module inspired in http://html-ipsum.com/ (Thanks Chris Bloom, https://github.com/ffaker/ffaker/pull/18)

## 1.7.0

FFaker::LoremCN (Thanks Shane Weng, Shane Weng, https://github.com/swcool, https://github.com/ffaker/ffaker/pull/16/files)

## 1.6.0

FFaker::NameDE (thanks David Noelte, https://github.com/marvin, https://github.com/ffaker/ffaker/pull/17)
Added FFaker::Internet#disposable_email (Thanks Port 80 Labs, https://github.com/port80labs, https://github.com/ffaker/ffaker/pull/15)

## 1.5.0

FFaker::NameRU (Thanks Vsevolod Romashov, https://github.com/7even, https://github.com/ffaker/ffaker/pull/14)

## 1.4.0

FFaker::Product and FFaker::Education (thanks Rico Sta. Cruz, https://github.com/ffaker/ffaker/pull/12 )

## 1.3.0

FFaker::Lorem.word as a convenience method, instead of FFaker::Lorem.words(1).first.

## 1.2.0

New FFaker::NameCN module (contributions by qichunren)

  FFaker::NameCN.first_name # => 鑫洋
  FFaker::NameCN.last_name # => 禹
  FFaker::NameCN.name # => 俊伶漫

## 1.1.0

Api additions (contributions by Robert Berry)

  FFaker::Internet.uri(protocol)
  FFaker::Internet.http_url
  FFaker::Internet.ip_v4_address

## 0.4.0

Api additions by Rafael Souza

  FFaker::Geolocation.lat # => 40.6609944585817
  FFaker::Geolocation.lng # => -73.8454648940358
  FFaker::Address.neighborhood # => "Renton West"


## 0.3.3 2010-01-14

* removed library file and directory "faker". now you only can load the gem using require 'ffaker'

## 0.3.2 2010-01-14

* Several Optimizations, renamed gem packege to ffaker.

## 0.3.1 2008-04-03

1 minor enhancement:

* Added city to Address

## 0.3.0 2008-01-01

3 major enhancements:

* Added Lorem to generate fake Latin
* Added secondary_address to Address, and made inclusion of secondary address in street_address optional (false by default).
* Added UK address methods [Caius Durling]

## 0.2.1 2007-12-05

1 major enhancement:

* Dropped facets to avoid conflict with ActiveSupport

2 minor enhancements:

* Changed the output of user_name to randomly separate with a . or _
* Added a few tests

## 0.1.0 2007-11-22

* Initial release
