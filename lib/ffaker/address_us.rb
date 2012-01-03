module Faker
  module AddressUS
    include Faker::Address
    extend ModuleUtils
    extend self

    def zip_code
      Faker.numerify ZIP_FORMATS.rand
    end

    def state
      STATE.rand
    end

    def state_abbr
      STATE_ABBR.rand
    end

    ZIP_FORMATS = k ['#####', '#####-####']

    STATE = k ['Alabama', 'Alaska', 'Arizona', 'Arkansas',
      'California', 'Colorado', 'Connecticut', 'Delaware', 'Florida',
      'Georgia', 'Hawaii', 'Idaho', 'Illinois', 'Indiana', 'Iowa', 'Kansas',
      'Kentucky', 'Louisiana', 'Maine', 'Maryland', 'Massachusetts',
      'Michigan', 'Minnesota', 'Mississippi', 'Missouri', 'Montana',
      'Nebraska', 'Nevada', 'New Hampshire', 'New Jersey', 'New Mexico', 'New York',
      'North Carolina', 'North Dakota', 'Ohio', 'Oklahoma', 'Oregon',
      'Pennsylvania', 'Rhode Island', 'South Carolina', 'South Dakota',
      'Tennessee', 'Texas', 'Utah', 'Vermont', 'Virginia', 'Washington',
      'West Virginia', 'Wisconsin', 'Wyoming']

    STATE_ABBR = k %w(AL AK AS AZ AR CA CO CT DE DC FM FL GA GU HI ID IL IN IA
                     KS KY LA ME MH MD MA MI MN MS MO MT NE NV NH NJ NM NY NC
                     ND MP OH OK OR PW PA PR RI SC SD TN TX UT VT VI VA WA WV
                     WI WY AE AA AP)
  end
end
