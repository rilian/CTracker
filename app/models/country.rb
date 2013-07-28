class Country < ActiveRecord::Base
  # Includes

  # Before, after callbacks

  # Default scopes, default values (e.g. self.per_page =)

  # Associations: belongs_to > has_one > has_many > has_and_belongs_to_many
  has_many :currencies

  # Validations: presence > by type > validates
  validates_presence_of :name
  validates_presence_of :code
  validates_uniqueness_of :code, :allow_blank => true

  # Other properties (e.g. accepts_nested_attributes_for)
  self.primary_key = 'code'

  attr_accessible :name, :code, :visited

  accepts_nested_attributes_for :currencies, :allow_destroy => true

  # Model dictionaries, state machine

  # Scopes
  class << self
  end

  scope :visited, :conditions => {:visited => true}
  scope :not_visited, :conditions => {:visited => false}

  # Other model methods

  # Private methods (for example: custom validators)
  private

end
