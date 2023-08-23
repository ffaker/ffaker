# frozen_string_literal: true

require_relative 'lib/ffaker/version'

Gem::Specification.new do |s|
  s.specification_version = 2 if s.respond_to? :specification_version=
  s.required_rubygems_version = Gem::Requirement.new('>= 0') if s.respond_to? :required_rubygems_version=
  s.rubygems_version = '1.3.5'

  s.name              = 'ffaker'
  s.version           = FFaker::VERSION
  s.required_ruby_version = '>= 3.0'

  s.license = 'MIT'

  s.summary     = 'Ffaker generates dummy data.'
  s.description = 'Ffaker generates dummy data.'

  s.authors = [
    'https://github.com/ffaker/ffaker/graphs/contributors',
    'Emmanuel Oga'
  ]
  s.email    = 'EmmanuelOga@gmail.com'
  s.homepage = 'https://github.com/ffaker/ffaker'

  s.require_paths = %w[lib]

  s.rdoc_options = ['--charset=UTF-8']
  s.extra_rdoc_files = %w[README.md LICENSE Changelog.md]

  s.files = `git ls-files`
          .split("\n")
          .sort
          .reject { |file| file =~ /^\./ }
          .reject { |file| file =~ /^(rdoc|pkg)/ }

  s.test_files = Dir['test/**/*']

  s.metadata = {
    'changelog_uri' => 'https://github.com/ffaker/ffaker/blob/main/Changelog.md',
    'documentation_uri' => 'https://github.com/ffaker/ffaker/blob/main/REFERENCE.md'
  }

  s.add_development_dependency 'rake', '~> 13.0'
  s.add_development_dependency 'rubocop'
  s.add_development_dependency 'test-unit'
end
