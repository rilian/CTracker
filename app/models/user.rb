class User < ActiveRecord::Base
  # Includes

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable, :omniauthable, :trackable, :recoverable
  devise :database_authenticatable, :registerable, :rememberable, :validatable

  # Before, after callbacks

  # Default scopes, default values (e.g. self.per_page =)

  # Associations: belongs_to > has_one > has_many > has_and_belongs_to_many
  has_many :user_countries, dependent: :destroy
  has_many :countries, through: :user_countries
  has_many :currencies, through: :countries

  # Validations: presence > by type > validates

  # Other properties (e.g. accepts_nested_attributes_for)
  attr_accessible :email, :password, :password_confirmation, :remember_me, :is_admin, :user_countries_attributes
  accepts_nested_attributes_for :user_countries, :allow_destroy => true

  # Model dictionaries, state machine

  # Scopes
  class << self
  end

  # Other model methods

  def not_visited_countries
    id_field = Country.arel_table[:id]
    country_ids = countries.pluck('id')
    country_ids << 0 if country_ids.empty?
    Country.where(id_field.not_in(country_ids))
  end

  def not_collected_currencies
    id_field = Currency.arel_table[:id]
    currency_ids = currencies.pluck('currencies.id')
    currency_ids << 0 if currency_ids.empty?
    Currency.where(id_field.not_in(currency_ids))
  end

  # Private methods (for example: custom validators)
  private

end
