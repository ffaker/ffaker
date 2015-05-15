require 'rake'

Gem::Specification.new do |s|
  s.name              = 'ffaker'
  s.version           = '2.0.0'
  s.date              = '2015-03-16'
  s.rubyforge_project = 'ffaker'
  s.required_ruby_version = '>= 1.9.3'

  s.license = 'MIT'

  s.summary     = 'Faster Faker, generates dummy data.'
  s.description = 'Faster Faker, generates dummy data. ffaker is a rewrite of faker.'

  s.authors  = ['Emmanuel Oga']
  s.email    = 'EmmanuelOga@gmail.com'
  s.homepage = 'http://github.com/emmanueloga/ffaker'

  s.extra_rdoc_files = %w(README.md LICENSE Changelog.md)

  s.files = FileList[
    'lib/**/*.rb', 'test/**/*.rb', 'scripts/*.rb', '*.md',
    'ffaker.gemspec', 'Rakefile', 'Gemfile', 'LICENSE'
  ]

  s.add_development_dependency 'rake', '~> 10.0'
  s.add_development_dependency 'minitest'
end
