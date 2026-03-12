# frozen_string_literal: true

require 'English'
require_relative 'lib/ffaker/version'

Gem::Specification.new do |s|
  s.required_rubygems_version = Gem::Requirement.new('>= 0') if s.respond_to? :required_rubygems_version=

  s.name              = 'ffaker'
  s.version           = FFaker::VERSION
  s.required_ruby_version = '>= 3.1'

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

  s.files = `git ls-files lib`.split($INPUT_RECORD_SEPARATOR) + ['Changelog.md', 'LICENSE', 'README.md']

  s.metadata = {
    'changelog_uri' => 'https://github.com/ffaker/ffaker/blob/main/Changelog.md',
    'documentation_uri' => 'https://github.com/ffaker/ffaker/blob/main/REFERENCE.md',
    'rubygems_mfa_required' => 'true'
  }
end
