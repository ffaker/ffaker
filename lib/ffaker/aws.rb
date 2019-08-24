# frozen_string_literal: true

module FFaker
  module AWS
    extend ModuleUtils
    extend self

    def instance_type
      fetch_sample(EC2_INSTANCE_TYPE)
    end

    def offering_type
      fetch_sample(EC2_RESERVED_OFFERING_TYPE)
    end

    def instance_tenancy
      fetch_sample(EC2_RESERVED_INSTANCE_TENANCY)
    end

    def product_description
      fetch_sample(EC2_RESERVED_PRODUCT_DESCRIPTION)
    end
  end
end
