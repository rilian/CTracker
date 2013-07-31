require 'cancan/matchers'

describe 'User' do
  subject { ability }
  let(:ability) { Ability.new(user) }
  let(:user) { nil }

  context 'when is an admin' do
    let(:user) { User.new(is_admin: true) }

    it { should be_able_to(:manage, :all) }
  end

  context 'when user not admin' do
    let(:user) { User.create(is_admin: false, email: 'user@example.com', password: '1'*6, password_confirmation: '1'*6) }
    let(:own_user_country) { UserCountry.new(user_id: user.id, country_id: 'a')}
    let(:other_user_country) { UserCountry.new(user_id: 0, country_id: 'a')}

    it { should be_able_to(:manage, own_user_country) }
    it { should_not be_able_to(:manage, other_user_country) }

    it { should be_able_to(:pie_chart, Country.new) }
    it { should be_able_to(:visit_multiple, Country.new) }
    it { should be_able_to(:pie_chart, Currency.new) }
    it { should be_able_to(:collect_multiple, Currency.new) }
  end
end
