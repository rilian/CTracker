require 'cancan/matchers'

describe 'User' do
  describe 'abilities' do
    subject { ability }
    let(:ability) { Ability.new(user) }
    let(:user) { nil }

    context 'when is an admin' do
      let(:user) { User.new(is_admin: true) }

      it { should be_able_to(:manage, :all) }
    end
  end
end
