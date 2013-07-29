class User < ActiveRecord::Base
  # Includes

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable, :omniauthable, :trackable,
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  # Before, after callbacks

  # Default scopes, default values (e.g. self.per_page =)

  # Associations: belongs_to > has_one > has_many > has_and_belongs_to_many
  has_many :user_countries, dependent: :destroy
  has_many :countries, through: :user_countries
  has_many :currencies, through: :countries

  # Validations: presence > by type > validates

  # Other properties (e.g. accepts_nested_attributes_for)
  attr_accessible :email, :password, :password_confirmation, :remember_me, :is_admin

  # Model dictionaries, state machine

  # Scopes
  class << self
  end

  # Other model methods

  def not_visited_countries
    code_field = Country.arel_table[:code]
    Country.where(code_field.not_in(countries.pluck('code')))
  end

  def not_collected_currencies
    code_field = Currency.arel_table[:code]
    Currency.where(code_field.not_in(currencies.pluck('currencies.code')))
  end

  # Private methods (for example: custom validators)
  private

end
