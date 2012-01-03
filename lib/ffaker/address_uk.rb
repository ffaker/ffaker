module Faker
  module AddressUK
    include Faker::Address
    extend ModuleUtils
    extend self

    def county
      UK_COUNTY.rand
    end

    def country
      UK_COUNTRY.rand
    end

    def postcode
      Faker.bothify(UK_POSTCODE.rand).upcase
    end

    UK_COUNTY = k ['Avon', 'Bedfordshire', 'Berkshire', 'Borders',
      'Buckinghamshire', 'Cambridgeshire', 'Central', 'Cheshire', 'Cleveland',
      'Clwyd', 'Cornwall', 'County Antrim', 'County Armagh', 'County Down',
      'County Fermanagh', 'County Londonderry', 'County Tyrone', 'Cumbria',
      'Derbyshire', 'Devon', 'Dorset', 'Dumfries and Galloway', 'Durham',
      'Dyfed', 'East Sussex', 'Essex', 'Fife', 'Gloucestershire', 'Grampian',
      'Greater Manchester', 'Gwent', 'Gwynedd County', 'Hampshire',
      'Herefordshire', 'Hertfordshire', 'Highlands and Islands', 'Humberside',
      'Isle of Wight', 'Kent', 'Lancashire', 'Leicestershire', 'Lincolnshire',
      'Lothian', 'Merseyside', 'Mid Glamorgan', 'Norfolk', 'North Yorkshire',
      'Northamptonshire', 'Northumberland', 'Nottinghamshire', 'Oxfordshire',
      'Powys', 'Rutland', 'Shropshire', 'Somerset', 'South Glamorgan',
      'South Yorkshire', 'Staffordshire', 'Strathclyde', 'Suffolk', 'Surrey',
      'Tayside', 'Tyne and Wear', 'Warwickshire', 'West Glamorgan', 'West Midlands',
      'West Sussex', 'West Yorkshire', 'Wiltshire', 'Worcestershire']

    UK_COUNTRY = k ['England', 'Scotland', 'Wales', 'Northern Ireland']

    UK_POSTCODE = k ['??# #??', '??## #??']
  end
end
