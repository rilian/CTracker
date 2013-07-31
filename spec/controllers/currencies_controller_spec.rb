require 'spec_helper'

describe CurrenciesController do
  before do
    @user = User.create!(email: 'user@example.com', password: 'please', password_confirmation: 'please')
    sign_in @user
  end

  describe 'POST "collect_multiple"' do
    before do
      @country_1 = Country.create!(name: 'USA', code: 'us')
      @currency_1 = Currency.create!(name: 'US Dollar', code: 'usd', country_id: @country_1.id)
      @country_2 = Country.create!(name: 'Russia', code: 'ru')
      @currency_2 = Currency.create!(name: 'Ruble', code: 'rub', country_id: @country_2.id)

      other_country = Country.create!(name: 'Ukraine', code: 'ua')
      Currency.create!(name: 'Hryvna', code: 'uah', country_id: other_country.id)

      post :collect_multiple, { currency_ids: [@currency_1.id, @currency_2.id] }
    end

    it 'collects multiple currencies' do
      response.should redirect_to currencies_path

      UserCountry.all.should have(2).items
      UserCountry.where(user_id: @user.id).map(&:country_id).should =~ [@country_1.id, @country_2.id]
    end
  end
end
