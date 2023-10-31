# frozen_string_literal: true

module FFaker
  module Guid
    extend ModuleUtils
    extend self

    # Because this method uses arbitrary hexadecimal characters it is likely to
    # generate invalid UUIDs--UUIDs must have a version (1-8) at bits 48-51,
    # and bits 64-65 must be 0b10.
    #
    # @deprecated Often generates invalid UUIDs. Use {UUID} instead.
    def guid
      warn '[guid] is deprecated. Use the UUID.uuidv4 method instead.'
      FFaker::UUID.uuidv4.upcase
    end
  end
end
