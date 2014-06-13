require "test_helper"


class CurrencyTest < ActiveSupport::TestCase
  should have_one(:countries_currency)
  should have_many(:countries).through(:countries_currency)

  should validate_presence_of :name
  should validate_presence_of :code
  should validate_uniqueness_of :code
end
