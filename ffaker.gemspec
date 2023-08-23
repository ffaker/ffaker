# frozen_string_literal: true

require_relative 'lib/ffaker/version'

Gem::Specification.new do |s|
  s.required_rubygems_version = Gem::Requirement.new('>= 0') if s.respond_to? :required_rubygems_version=

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
            .grep_v(/^\./)
            .grep_v(/^(rdoc|pkg)/)

  s.metadata = {
    'changelog_uri' => 'https://github.com/ffaker/ffaker/blob/main/Changelog.md',
    'documentation_uri' => 'https://github.com/ffaker/ffaker/blob/main/REFERENCE.md',
    'rubygems_mfa_required' => 'true'
  }
end
