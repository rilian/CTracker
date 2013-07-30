require 'spec_helper'

describe Currency do
  it { should have_db_column(:name).of_type(:string) }
  it { should have_db_column(:code).of_type(:string) }
  it { should have_db_column(:country_id).of_type(:integer) }
  it { should have_db_column(:country_code).of_type(:string) }
  it { should have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
  it { should have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }

  it { should have_db_index(:country_id) }

  it { should allow_mass_assignment_of :name }
  it { should allow_mass_assignment_of :code }
  it { should allow_mass_assignment_of :country_id }

  it { should validate_presence_of :name }
  it { should validate_presence_of :code }
  it { should validate_uniqueness_of(:code) }

  describe '.collected_by_user?' do
    context 'when country not set' do
      subject { described_class.create!(name: 'a', code: 'b', country_id: nil) }

      it 'is not collected' do
        subject.collected_by_user?(User.new).should be_false
      end
    end

    context 'when country set' do
      before do
        @user = User.create!(email: 'user@example.com', password: '1'*6, password_confirmation: '1'*6)
        @country = Country.create!(name: 'Ukr', code: 'ua')
        UserCountry.create!(user_id: @user.id, country_id: @country.id)
      end

      subject { described_class.create!(name: 'Hryvna', code: 'uah', country_id: @country.id) }

      it 'is collected' do
        subject.collected_by_user?(@user).should be_true
      end
    end
  end
end
