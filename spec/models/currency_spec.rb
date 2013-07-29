require 'spec_helper'

describe Currency do
  it { should have_db_column(:name).of_type(:string) }
  it { should have_db_column(:code).of_type(:string) }
  it { should have_db_column(:country_id).of_type(:string) }
  it { should have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
  it { should have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }

  it { should have_db_index(:country_id) }

  it { should allow_mass_assignment_of :name }
  it { should allow_mass_assignment_of :code }
  it { should allow_mass_assignment_of :country_id }

  it { should validate_presence_of :name }
  it { should validate_presence_of :code }
  it { should validate_uniqueness_of(:code) }

  describe '.collected_by_user??' do
    pending
  end
end
