require 'spec_helper'

describe CountriesController do
  before do
    @user = User.create!(email: 'user@example.com', password: 'please', password_confirmation: 'please')
    sign_in @user
  end

  describe 'POST "visit_multiple"' do
    before do
      @country_1 = Country.create!(name: 'USA', code: 'us')
      @country_2 = Country.create!(name: 'Russia', code: 'ru')
      Country.create!(name: 'Ukraine', code: 'ua')

      post :visit_multiple, { country_ids: [@country_1.id, @country_2.id] }
    end

    it 'visits multiple countries' do
      response.should be_success

      UserCountry.all.should have(2).items
      UserCountry.where(user_id: @user.id).map(&:country_id).should =~ [@country_1.id, @country_2.id]
    end
  end
end
