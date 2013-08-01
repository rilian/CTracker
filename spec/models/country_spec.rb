require 'spec_helper'

describe Country do
  it { should have_db_column(:name).of_type(:string) }
  it { should have_db_column(:code).of_type(:string) }
  it { should have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
  it { should have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }

  it { should have_db_index(:code) }
  it { should have_db_index(:name) }

  it { should allow_mass_assignment_of :name }
  it { should allow_mass_assignment_of :code }
  it { should allow_mass_assignment_of :visited }
  it { should allow_mass_assignment_of :visitor_id }

  it { should accept_nested_attributes_for(:currencies).allow_destroy(true) }

  it { should validate_presence_of :name }
  it { should validate_presence_of :code }
  it { should validate_uniqueness_of(:code) }

  describe '.visited_by_user?' do
    context 'when no user_country records' do
      subject { described_class.create!(name: 'a', code: 'b') }

      it 'is not visited' do
        subject.visited_by_user?(User.new).should be_false
      end
    end

    context 'when user_country records exist' do
      before do
        @user = User.create!(email: 'user@example.com', password: '1'*6, password_confirmation: '1'*6)
        @country = Country.create!(name: 'Ukr', code: 'ua')
        UserCountry.create!(user_id: @user.id, country_id: @country.id)
      end

      it 'is visited' do
        @country.visited_by_user?(@user).should be_true
      end
    end
  end

  describe '#visit_country' do
    before do
      @country = Country.create!(name: 'a', code: 'b', visited: false)
    end

    it 'records that user visited country' do
      UserCountry.should have(0).items

      @country.visit!(Struct.new(:id).new(1)).should be_true

      UserCountry.where(user_id: 1, country_id: @country.id).should have(1).item
    end
  end

  describe '.visit!' do
    pending
  end
end
