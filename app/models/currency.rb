class Currency < ActiveRecord::Base
  # Includes

  # Before, after callbacks

  # Default scopes, default values (e.g. self.per_page =)

  # Associations: belongs_to > has_one > has_many > has_and_belongs_to_many
  belongs_to :country
  has_many :user_countries, through: :country#, source: :currency

  # Validations: presence > by type > validates
  validates_presence_of :name
  validates_presence_of :code
  validates_uniqueness_of :code, :allow_blank => true

  # Other properties (e.g. accepts_nested_attributes_for)
  self.primary_key = 'code'

  attr_accessible :name, :code, :country_id

  # Model dictionaries, state machine

  # Scopes
  class << self
  end

  scope :collected_by_user, ->(user) {
    user_id = UserCountry.arel_table[:user_id]

    joins(:country).joins(:user_countries).where(user_id.eq(user.id))
  }

  scope :not_collected_by_user, ->(user) {
    user_countries = UserCountry.select('country_id').where(user_id: user.id).to_sql
    country_id = self.arel_table[:country_id]

    where(country_id.not_in(user_countries))
  }

  # Other model methods

  def collected_by_user?(user)
    country.nil? ? false : user_countries.of_user(user).exists?
  end

  # Private methods (for example: custom validators)
  private

end
