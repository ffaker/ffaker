Gem::Specification.new do |s|
  s.specification_version = 2 if s.respond_to? :specification_version=
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.rubygems_version = '1.3.5'

  s.name              = 'ffaker'
  s.version           = '1.18.0'
  s.date              = '2013-08-06'
  s.rubyforge_project = 'ffaker'

  s.summary     = "Faster Faker, generates dummy data."
  s.description = "Faster Faker, generates dummy data."

  s.authors  = ["Emmanuel Oga"]
  s.email    = 'EmmanuelOga@gmail.com'
  s.homepage = 'http://github.com/emmanueloga/ffaker'

  s.require_paths = %w[lib]

  s.rdoc_options = ["--charset=UTF-8"]
  s.extra_rdoc_files = %w[README.md LICENSE Changelog.md]

  # = MANIFEST =
  s.files = %w[
    Changelog.md
    Gemfile
    LICENSE
    README.md
    Rakefile
    ffaker.gemspec
    lib/ffaker.rb
    lib/ffaker/address.rb
    lib/ffaker/address_au.rb
    lib/ffaker/address_ca.rb
    lib/ffaker/address_da.rb
    lib/ffaker/address_de.rb
    lib/ffaker/address_mx.rb
    lib/ffaker/address_se.rb
    lib/ffaker/address_sn.rb
    lib/ffaker/address_uk.rb
    lib/ffaker/address_us.rb
    lib/ffaker/bacon_ipsum.rb
    lib/ffaker/company.rb
    lib/ffaker/company_se.rb
    lib/ffaker/conference.rb
    lib/ffaker/dizzle_ipsum.rb
    lib/ffaker/education.rb
    lib/ffaker/geolocation.rb
    lib/ffaker/healthcare_ipsum.rb
    lib/ffaker/hipster_ipsum.rb
    lib/ffaker/html_ipsum.rb
    lib/ffaker/identification.rb
    lib/ffaker/internet.rb
    lib/ffaker/internet_se.rb
    lib/ffaker/job.rb
    lib/ffaker/lorem.rb
    lib/ffaker/lorem_ar.rb
    lib/ffaker/lorem_cn.rb
    lib/ffaker/movie.rb
    lib/ffaker/name.rb
    lib/ffaker/name_cn.rb
    lib/ffaker/name_da.rb
    lib/ffaker/name_de.rb
    lib/ffaker/name_ga.rb
    lib/ffaker/name_ja.rb
    lib/ffaker/name_kr.rb
    lib/ffaker/name_mx.rb
    lib/ffaker/name_ph.rb
    lib/ffaker/name_ru.rb
    lib/ffaker/name_se.rb
    lib/ffaker/name_sn.rb
    lib/ffaker/name_vn.rb
    lib/ffaker/phone_number.rb
    lib/ffaker/phone_number_au.rb
    lib/ffaker/phone_number_da.rb
    lib/ffaker/phone_number_mx.rb
    lib/ffaker/phone_number_se.rb
    lib/ffaker/phone_number_sg.rb
    lib/ffaker/phone_number_sn.rb
    lib/ffaker/product.rb
    lib/ffaker/ssn.rb
    lib/ffaker/ssn_se.rb
    lib/ffaker/string.rb
    lib/ffaker/time.rb
    lib/ffaker/utils/array_utils.rb
    lib/ffaker/utils/module_utils.rb
    lib/ffaker/venue.rb
    scripts/benchmark.rb
    scripts/profile.sh
    scripts/profiling.rb
    test/helper.rb
    test/test_address.rb
    test/test_address_au.rb
    test/test_address_ca.rb
    test/test_address_de.rb
    test/test_address_mx.rb
    test/test_address_se.rb
    test/test_address_sn.rb
    test/test_address_uk.rb
    test/test_address_us.rb
    test/test_array_utils.rb
    test/test_bacon_ipsum.rb
    test/test_company.rb
    test/test_company_se.rb
    test/test_conference.rb
    test/test_dizzle_ipsum.rb
    test/test_education.rb
    test/test_faker.rb
    test/test_faker_internet.rb
    test/test_faker_internet_se.rb
    test/test_faker_job.rb
    test/test_faker_name.rb
    test/test_faker_name_cn.rb
    test/test_faker_name_de.rb
    test/test_faker_name_ga.rb
    test/test_faker_name_ja.rb
    test/test_faker_name_kr.rb
    test/test_faker_name_mx.rb
    test/test_faker_name_ph.rb
    test/test_faker_name_ru.rb
    test/test_faker_name_se.rb
    test/test_faker_name_sn.rb
    test/test_geolocation.rb
    test/test_healthcare_ipsum.rb
    test/test_hipster_ipsum.rb
    test/test_html_ipsum.rb
    test/test_identification.rb
    test/test_lorem.rb
    test/test_lorem_ar.rb
    test/test_lorem_cn.rb
    test/test_module_utils.rb
    test/test_movie.rb
    test/test_phone_number.rb
    test/test_phone_number_au.rb
    test/test_phone_number_mx.rb
    test/test_phone_number_se.rb
    test/test_phone_number_sg.rb
    test/test_phone_number_sn.rb
    test/test_ssn.rb
    test/test_ssn_se.rb
    test/test_string.rb
    test/test_time.rb
    test/test_venue.rb
  ]
  # = MANIFEST =

  s.test_files = s.files.select { |path| path =~ /^test\/test_.*\.rb/ }

  s.add_development_dependency 'rake'
  s.add_development_dependency 'test-unit'
end
