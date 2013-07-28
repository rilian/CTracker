class Currency < ActiveRecord::Base
  # Includes

  # Before, after callbacks

  # Default scopes, default values (e.g. self.per_page =)

  # Associations: belongs_to > has_one > has_many > has_and_belongs_to_many
  belongs_to :country

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

  # Other model methods
  def self.collected
    all.select { |currency| currency.collected? }
  end

  def self.not_collected
    all.reject { |currency| currency.collected? }
  end

  def collected?
    country.nil? ? false : country.visited?
  end

  # Private methods (for example: custom validators)
  private

end
