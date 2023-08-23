# frozen_string_literal: true

require 'rubygems'
require 'rake'
require 'date'

require 'test/unit/testsuite'

module Test
  module Unit
    class TestSuite
      def run(result, &progress_block)
        yield(STARTED, name)
        run_startup(result)
        @tests.each do |test|
          test.run(result, &progress_block)
          break unless result.passed?
        end
        run_shutdown(result)
        yield(FINISHED, name)
      end
    end
  end
end

require 'rubocop/rake_task'

RuboCop::RakeTask.new

#############################################################################
#
# Helper functions
#
#############################################################################

def name
  @name ||= Dir['*.gemspec'].first.split('.').first
end

def version
  line = File.read("lib/#{name}/version.rb")[/^\s*VERSION\s*=\s*.*/]
  line.match(/.*VERSION\s*=\s*['"](.*)['"]/)[1]
end

def date
  Date.today.to_s
end

def gemspec_file
  "#{name}.gemspec"
end

def gem_file
  "#{name}-#{version}.gem"
end

#############################################################################
#
# Standard tasks
#
#############################################################################

require 'rake/testtask'
Rake::TestTask.new do |t|
  t.libs << 'test/' << 'lib/'
  t.test_files = FileList['test/test*.rb']
  t.verbose = true
end

task default: :test

#############################################################################
#
# Custom tasks (add your own tasks here)
#
#############################################################################

begin
  require 'yard'
  YARD::Rake::YardocTask.new
rescue LoadError
  task :yardoc do
    abort 'YARD is not available. In order to run yardoc, you must: sudo gem install yard'
  end
end

desc 'Packaging tasks'
task release: :build do
  unless `git branch`.match?(/^\* main$/)
    puts 'You must be on the main branch to release!'
    exit!
  end
  sh "git commit --allow-empty -a -m 'Release #{version}'"
  sh "git tag v#{version}"
  sh 'git push origin main'
  sh 'git push --tags'
  sh "gem push pkg/#{name}-#{version}.gem"
end

task build: %i[validate reference] do
  sh 'mkdir -p pkg'
  sh "gem build #{gemspec_file} --output=pkg/#{gem_file}"
end

desc 'Validate library files'
task :validate do
  libfiles = Dir['lib/*'] - ["lib/#{name}.rb", "lib/#{name}"]
  unless libfiles.empty?
    puts "Directory `lib` should only contain a `#{name}.rb` file and `#{name}` dir. Found:"
    libfiles.each do |libfile|
      puts "- #{libfile}"
    end

    exit!
  end
end

desc 'Creates REFERENCE.md'
task :reference do
  system 'ruby -Ilib ./scripts/reference.rb > REFERENCE.md'
end
