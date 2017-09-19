Gem::Specification.new do |s|
  s.specification_version = 2 if s.respond_to? :specification_version=
  s.required_rubygems_version = Gem::Requirement.new('>= 0') if s.respond_to? :required_rubygems_version=
  s.rubygems_version = '1.3.5'

  s.name              = 'ffaker'
  s.version           = '2.7.0'
  s.date              = '2017-09-19'
  s.rubyforge_project = 'ffaker'
  s.required_ruby_version = '>= 1.9'

  s.license = 'MIT'

  s.summary     = 'Ffaker generates dummy data.'
  s.description = 'Ffaker generates dummy data.'

  s.authors = [
    'https://github.com/ffaker/ffaker/graphs/contributors',
    'Emmanuel Oga'
  ]
  s.email    = 'EmmanuelOga@gmail.com'
  s.homepage = 'http://github.com/ffaker/ffaker'

  s.require_paths = %w[lib]

  s.rdoc_options = ['--charset=UTF-8']
  s.extra_rdoc_files = %w[README.md LICENSE Changelog.md]

  # = MANIFEST =
  s.files = %w[
    Changelog.md
    Gemfile
    LICENSE
    README.md
    REFERENCE.md
    Rakefile
    ffaker.gemspec
  ] + Dir['lib/**/*', 'scripts/*']
  # = MANIFEST =

  s.test_files = Dir['test/**/*']

  s.add_development_dependency 'rake', '~> 10.1.1'
  s.add_development_dependency 'test-unit'
end
