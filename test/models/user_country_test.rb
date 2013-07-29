require 'test_helper'

class UserCountryTest < ActiveSupport::TestCase
  test_validates_presence_of :user, :country
end
