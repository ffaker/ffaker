
Gem::Specification.new do |s|
  s.specification_version = 2 if s.respond_to? :specification_version=
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.rubygems_version = '1.3.5'

  s.name              = 'ffaker'
  s.version           = '1.5.0'
  s.date              = '2011-04-02'
  s.rubyforge_project = 'ffaker'

  s.summary     = "Faster Faker, generates dummy data."
  s.description = "Faster Faker, generates dummy data."

  s.authors  = ["Emmanuel Oga"]
  s.email    = 'EmmanuelOga@gmail.com'
  s.homepage = 'http://github.com/emmanueloga/ffaker'

  s.require_paths = %w[lib]

  s.rdoc_options = ["--charset=UTF-8"]
  s.extra_rdoc_files = %w[README.rdoc LICENSE]

  # = MANIFEST =
  s.files = %w[
    History.txt
    LICENSE
    README.rdoc
    Rakefile
    ffaker.gemspec
    lib/ffaker.rb
    lib/ffaker/address.rb
    lib/ffaker/company.rb
    lib/ffaker/education.rb
    lib/ffaker/geolocation.rb
    lib/ffaker/internet.rb
    lib/ffaker/lorem.rb
    lib/ffaker/name.rb
    lib/ffaker/name_cn.rb
    lib/ffaker/name_ru.rb
    lib/ffaker/phone_number.rb
    lib/ffaker/product.rb
    lib/ffaker/utils/array_utils.rb
    lib/ffaker/utils/module_utils.rb
    scripts/benchmark.rb
    scripts/profile.sh
    scripts/profiling.rb
    test/helper.rb
    test/test_address.rb
    test/test_array_utils.rb
    test/test_company.rb
    test/test_faker.rb
    test/test_faker_internet.rb
    test/test_faker_name.rb
    test/test_faker_name_cn.rb
    test/test_faker_name_ru.rb
    test/test_geolocation.rb
    test/test_lorem.rb
    test/test_module_utils.rb
    test/test_phone_number.rb
  ]
  # = MANIFEST =

  s.test_files = s.files.select { |path| path =~ /^test\/test_.*\.rb/ }
end
