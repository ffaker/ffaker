
Gem::Specification.new do |s|
  s.specification_version = 2 if s.respond_to? :specification_version=
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.rubygems_version = '1.3.7'

  s.name              = 'ffaker-alt'
  s.version           = '1.0.0'
  s.date              = '2011-01-12'

  s.summary     = "Faster Faker, generates dummy data."
  s.description = "Faster Faker, generates dummy data."

  s.authors  = ["Emmanuel Oga"]
  s.email    = 'EmmanuelOga@gmail.com'
  s.homepage = 'http://github.com/bdigital/ffaker'

  s.require_paths = %w[lib]

  s.rdoc_options = ["--charset=UTF-8"]
  s.extra_rdoc_files = %w[README.rdoc LICENSE]

  # = MANIFEST =
  s.files = %w[
    History.txt
    LICENSE
    README.rdoc
    Rakefile
    ffaker-alt.gemspec
    lib/ffaker-alt.rb
    lib/ffaker-alt/address.rb
    lib/ffaker-alt/company.rb
    lib/ffaker-alt/geolocation.rb
    lib/ffaker-alt/internet.rb
    lib/ffaker-alt/lorem.rb
    lib/ffaker-alt/name.rb
    lib/ffaker-alt/phone_number.rb
    lib/ffaker-alt/utils/array_utils.rb
    lib/ffaker-alt/utils/module_utils.rb
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
    test/test_geolocation.rb
    test/test_lorem.rb
    test/test_module_utils.rb
    test/test_phone_number.rb
  ]
  # = MANIFEST =

  s.test_files = s.files.select { |path| path =~ /^test\/test_.*\.rb/ }
end
