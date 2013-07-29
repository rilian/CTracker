class User < ActiveRecord::Base
  # Includes

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable, :omniauthable, :trackable,
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  # Before, after callbacks

  # Default scopes, default values (e.g. self.per_page =)

  # Associations: belongs_to > has_one > has_many > has_and_belongs_to_many

  # Validations: presence > by type > validates

  # Other properties (e.g. accepts_nested_attributes_for)
  attr_accessible :email, :password, :password_confirmation, :remember_me

  # Model dictionaries, state machine

  # Scopes
  class << self
  end

  # Other model methods

  # Private methods (for example: custom validators)
  private

end
