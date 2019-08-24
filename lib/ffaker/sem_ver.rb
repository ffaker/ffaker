# frozen_string_literal: true

module FFaker
  module SemVer
    extend ModuleUtils
    extend self

    UPDATE = %w[major minor patch].freeze

    def next(previous_version = '0.0.0')
      major, minor, patch = previous_version.split('.').map(&:to_i)
      case fetch_sample(UPDATE)
      when 'major' then "#{major + 1}.0.0"
      when 'minor' then "#{major}.#{minor + 1}.0"
      when 'patch' then "#{major}.#{minor}.#{patch + 1}"
      end
    end
  end
end
