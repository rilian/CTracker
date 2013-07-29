class UserCountry < ActiveRecord::Base
  # Includes

  # Before, after callbacks

  # Default scopes, default values (e.g. self.per_page =)

  # Associations: belongs_to > has_one > has_many > has_and_belongs_to_many
  belongs_to :user
  belongs_to :country

  # Validations: presence > by type > validates
  validates_presence_of :user
  validates_presence_of :country
  validates_uniqueness_of :user_id, scope: :country_id

  # Other properties (e.g. accepts_nested_attributes_for)
  attr_accessible :user_id, :country_id

  # Model dictionaries, state machine

  # Scopes
  class << self
  end

  # Other model methods
  def self.of_user(user)
    where(user_id: user.id)
  end

  # Private methods (for example: custom validators)
  private

end
