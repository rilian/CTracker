require 'spec_helper'

describe User do
  it { should have_db_column(:email).of_type(:string).with_options(default: '', null: false) }
  it { should have_db_column(:encrypted_password).of_type(:string).with_options(default: '', null: false) }
  it { should have_db_column(:reset_password_token).of_type(:string) }
  it { should have_db_column(:reset_password_sent_at).of_type(:datetime) }
  it { should have_db_column(:remember_created_at).of_type(:datetime) }
  it { should have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
  it { should have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }

  it { should have_db_index(:email) }
  it { should have_db_index(:reset_password_token) }

  it { should allow_mass_assignment_of :email }
  it { should allow_mass_assignment_of :password }
  it { should allow_mass_assignment_of :password_confirmation }
  it { should allow_mass_assignment_of :remember_me }

  describe '.not_visited_countries' do
    pending
  end

  describe '.not_collected_currencies' do
    pending
  end
end
