require 'spec_helper'

describe Country do
  it { should have_db_column(:name).of_type(:string) }
  it { should have_db_column(:code).of_type(:string) }
  it { should have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
  it { should have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }

  it { should have_db_index(:code) }

  it { should allow_mass_assignment_of :name }
  it { should allow_mass_assignment_of :code }
  it { should allow_mass_assignment_of :visited }
  it { should allow_mass_assignment_of :visitor_id }

  it { should accept_nested_attributes_for(:currencies).allow_destroy(true) }

  it { should validate_presence_of :name }
  it { should validate_presence_of :code }
  it { should validate_uniqueness_of(:code) }

  describe '.visited_by_user?' do
    pending
  end
end
