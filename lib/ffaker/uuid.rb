# frozen_string_literal: true

require 'date'

module FFaker
  # UUIDs are a 128-bit value (16 bytes), often represented as a
  # 32-character hexadecimal string in the format
  # `xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx`.
  #
  # @note This generates lowercase strings, but UUIDs are case-insensitive.
  #
  # @see https://www.rfc-editor.org/rfc/rfc4122#section-4
  # @see https://datatracker.ietf.org/doc/draft-ietf-uuidrev-rfc4122bis/
  module UUID
    extend ModuleUtils
    extend self

    # > UUID version 4 is meant for generating UUIDs from truly-random or
    # > pseudo-random numbers.
    def uuidv4
      uuid = 0
      # random_a
      # > The first 48 bits of the layout that can be filled with random data
      # > as specified in Section 6.9. Occupies bits 0 through 47 (octets 0-5).
      uuid |= rand((2**48) - 1) << 80
      # ver
      # > The 4 bit version field as defined by Section 4.2, set to 0b0100 (4).
      # > Occupies bits 48 through 51 of octet 6.
      uuid |= 0b0100 << 76
      # random_b
      # > 12 more bits of the layout that can be filled random data as per
      # > Section 6.9. Occupies bits 52 through 63 (octets 6-7).
      uuid |= rand((2**12) - 1) << 64
      # var
      # > The 2 bit variant field as defined by Section 4.1, set to 0b10.
      # > Occupies bits 64 and 65 of octet 8.
      uuid |= 0b10 << 62
      # random_c
      # > The final 62 bits of the layout immediately following the var field
      # > field to be filled with random data as per Section 6.9. Occupies bits
      # > 66 through 127 (octets 8-15).
      uuid |= rand((2**62) - 1)

      as_string(uuid)
    end

    # > UUID version 6 is a field-compatible version of UUIDv1 Section 5.1,
    # > reordered for improved DB locality. It is expected that UUIDv6 will
    # > primarily be used in contexts where UUIDv1 is used. Systems that do not
    # > involve legacy UUIDv1 SHOULD use UUIDv7 instead.
    def uuidv6
      timestamp = rand((2**60) - 1)

      uuid = 0
      # time_high
      # > The most significant 32 bits of the 60 bit starting timestamp.
      # > Occupies bits 0 through 31 (octets 0-3).
      # @note Shifts 28 bits to remove `time_mid` and `time_low`.
      uuid |= (timestamp >> 28) << 96
      # time_mid
      # > The middle 16 bits of the 60 bit starting timestamp. Occupies bits 32
      # > through 47 (octets 4-5).
      # @note Shifts 12 bits to remove `time_low`.
      uuid |= ((timestamp >> 12) & ((2**16) - 1)) << 80
      # ver
      # > The 4 bit version field as defined by Section 4.2, set to 0b0110 (6).
      # > Occupies bits 48 through 51 of octet 6.
      uuid |= 0b0110 << 76
      # time_low
      # > 12 bits that will contain the least significant 12 bits from the 60
      # > bit starting timestamp. Occupies bits 52 through 63 (octets 6-7).
      uuid |= (timestamp & ((2**12) - 1)) << 64
      # var
      # > The 2 bit variant field as defined by Section 4.1, set to 0b10.
      # > Occupies bits 64 and 65 of octet 8.
      uuid |= 0b10 << 62
      # clk_seq
      # > The 14 bits containing the clock sequence. Occupies bits 66 through
      # > 79 (octets 8-9).
      #
      # (earlier in the document)
      # > The clock sequence and node bits SHOULD be reset to a pseudo-random
      # > value for each new UUIDv6 generated; however, implementations MAY
      # > choose to retain the old clock sequence and MAC address behavior from
      # > Section 5.1.
      uuid |= rand((2**14) - 1) << 48
      # node
      # > 48 bit spatially unique identifier. Occupies bits 80 through 127
      # > (octets 10-15).
      uuid |= rand((2**48) - 1)

      as_string(uuid)
    end

    # > UUID version 7 features a time-ordered value field derived from the
    # > widely implemented and well known Unix Epoch timestamp source, the
    # > number of milliseconds since midnight 1 Jan 1970 UTC, leap seconds
    # > excluded. UUIDv7 generally has improved entropy characteristics over
    # > UUIDv1 Section 5.1 or UUIDv6 Section 5.6.
    def uuidv7
      timestamp = rand((2**48) - 1)

      uuid = 0
      # unix_ts_ms
      # > 48 bit big-endian unsigned number of Unix epoch timestamp in
      # > milliseconds as per Section 6.1. Occupies bits 0 through 47 (octets
      # > 0-5).
      uuid |= timestamp << 80
      # ver
      # > The 4 bit version field as defined by Section 4.2, set to 0b0111 (7).
      # > Occupies bits 48 through 51 of octet 6.
      uuid |= 0b0111 << 76
      # rand_a
      # > 12 bits pseudo-random data to provide uniqueness as per Section 6.9
      # > and/or optional constructs to guarantee additional monotonicity as
      # > per Section 6.2. Occupies bits 52 through 63 (octets 6-7).
      uuid |= rand((2**12) - 1) << 64
      # var
      # > The 2 bit variant field as defined by Section 4.1, set to 0b10.
      # > Occupies bits 64 and 65 of octet 8.
      uuid |= 0b10 << 62
      # rand_b
      # > The final 62 bits of pseudo-random data to provide uniqueness as per
      # > Section 6.9 and/or an optional counter to guarantee additional
      # > monotonicity as per Section 6.2. Occupies bits 66 through 127 (octets
      # > 8-15).
      uuid |= rand((2**62) - 1)

      as_string(uuid)
    end

    # > UUID version 8 provides an RFC-compatible format for experimental or
    # > vendor-specific use cases. The only requirement is that the variant and
    # > version bits MUST be set as defined in Section 4.1 and Section 4.2.
    # > UUIDv8's uniqueness will be implementation-specific and MUST NOT be
    # > assumed.
    # >
    # > [...] To be clear: UUIDv8 is not a replacement for UUIDv4 Section 5.4
    # > where all 122 extra bits are filled with random data.
    def uuidv8
      uuid = 0
      # custom_a
      # > The first 48 bits of the layout that can be filled as an
      # > implementation sees fit. Occupies bits 0 through 47 (octets 0-5).
      uuid |= rand((2**48) - 1) << 80
      # ver
      # > The 4 bit version field as defined by Section 4.2, set to 0b1000 (8).
      # > Occupies bits 48 through 51 of octet 6.
      uuid |= 0b1000 << 76
      # custom_b
      # > 12 more bits of the layout that can be filled as an implementation
      # > sees fit. Occupies bits 52 through 63 (octets 6-7).
      uuid |= rand((2**12) - 1) << 64
      # var
      # > The 2 bit variant field as defined by Section 4.1, set to 0b10.
      # > Occupies bits 64 and 65 of octet 8.
      uuid |= 0b10 << 62
      # custom_c
      # > The final 62 bits of the layout immediately following the var field
      # > to be filled as an implementation sees fit. Occupies bits 66 through
      # > 127 (octets 8-15).
      uuid |= rand((2**62) - 1)

      as_string(uuid)
    end

    private

    def as_string(uuid)
      uuid.to_s(16)
          .rjust(32, '0')
          .gsub(/(.{8})(.{4})(.{4})(.{4})(.{12})/, '\1-\2-\3-\4-\5')
    end
  end
end
