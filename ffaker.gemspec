Gem::Specification.new do |s|
  s.specification_version = 2 if s.respond_to? :specification_version=
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.rubygems_version = '1.3.5'

  s.name              = 'ffaker'
  s.version           = '1.15.0'
  s.date              = '2012-07-03'
  s.rubyforge_project = 'ffaker'

  s.summary     = "Faster Faker, generates dummy data."
  s.description = "Faster Faker, generates dummy data."

  s.authors  = ["Emmanuel Oga"]
  s.email    = 'EmmanuelOga@gmail.com'
  s.homepage = 'http://github.com/emmanueloga/ffaker'

  s.require_paths = %w[lib]

  s.rdoc_options = ["--charset=UTF-8"]
  s.extra_rdoc_files = %w[README.rdoc LICENSE Changelog.rdoc]

  # = MANIFEST =
  s.files = %w[
    Changelog.rdoc
    LICENSE
    README.rdoc
    Rakefile
    ffaker.gemspec
    lib/ffaker.rb
    lib/ffaker/address.rb
    lib/ffaker/address_au.rb
    lib/ffaker/address_ca.rb
    lib/ffaker/address_da.rb
    lib/ffaker/address_de.rb
    lib/ffaker/address_sn.rb
    lib/ffaker/address_uk.rb
    lib/ffaker/address_us.rb
    lib/ffaker/company.rb
    lib/ffaker/education.rb
    lib/ffaker/geolocation.rb
    lib/ffaker/hipster_ipsum.rb
    lib/ffaker/html_ipsum.rb
    lib/ffaker/internet.rb
    lib/ffaker/job.rb
    lib/ffaker/lorem.rb
    lib/ffaker/lorem_cn.rb
    lib/ffaker/name.rb
    lib/ffaker/name_cn.rb
    lib/ffaker/name_da.rb
    lib/ffaker/name_de.rb
    lib/ffaker/name_ja.rb
    lib/ffaker/name_kr.rb
    lib/ffaker/name_ru.rb
    lib/ffaker/name_sn.rb
    lib/ffaker/name_vn.rb
    lib/ffaker/phone_number.rb
    lib/ffaker/phone_number_au.rb
    lib/ffaker/phone_number_da.rb
    lib/ffaker/phone_number_sg.rb
    lib/ffaker/phone_number_sn.rb
    lib/ffaker/product.rb
    lib/ffaker/utils/array_utils.rb
    lib/ffaker/utils/module_utils.rb
    scripts/benchmark.rb
    scripts/profile.sh
    scripts/profiling.rb
    test/helper.rb
    test/test_address.rb
    test/test_address_au.rb
    test/test_address_ca.rb
    test/test_address_de.rb
    test/test_address_sn.rb
    test/test_address_uk.rb
    test/test_address_us.rb
    test/test_array_utils.rb
    test/test_company.rb
    test/test_education.rb
    test/test_faker.rb
    test/test_faker_internet.rb
    test/test_faker_job.rb
    test/test_faker_name.rb
    test/test_faker_name_cn.rb
    test/test_faker_name_de.rb
    test/test_faker_name_ja.rb
    test/test_faker_name_kr.rb
    test/test_faker_name_ru.rb
    test/test_faker_name_sn.rb
    test/test_geolocation.rb
    test/test_hipster_ipsum.rb
    test/test_html_ipsum.rb
    test/test_lorem.rb
    test/test_lorem_cn.rb
    test/test_module_utils.rb
    test/test_phone_number.rb
    test/test_phone_number_au.rb
    test/test_phone_number_sg.rb
    test/test_phone_number_sn.rb
  ]
  # = MANIFEST =

  s.test_files = s.files.select { |path| path =~ /^test\/test_.*\.rb/ }

  s.add_development_dependency 'rake'
  s.add_development_dependency 'test-unit'
end
