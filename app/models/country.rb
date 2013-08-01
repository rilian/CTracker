class Country < ActiveRecord::Base
  # Includes

  # Before, after callbacks
  after_update :visit_country, if: Proc.new { |c| c.visited }

  # Default scopes, default values (e.g. self.per_page =)

  # Associations: belongs_to > has_one > has_many > has_and_belongs_to_many
  has_many :currencies
  has_many :user_countries, dependent: :destroy

  # Validations: presence > by type > validates
  validates_presence_of :name
  validates_presence_of :code
  validates_uniqueness_of :code, :allow_blank => true

  # Other properties (e.g. accepts_nested_attributes_for)

  attr_accessor :visited
  attr_accessor :visitor_id
  attr_accessible :name, :code, :visited, :visitor_id

  accepts_nested_attributes_for :currencies, :allow_destroy => true

  # Model dictionaries, state machine

  # Scopes
  class << self
  end

  # Other model methods

  def visited_by_user?(user)
    user_countries.of_user(user).exists?
  end

  def visit!(user)
    self.visitor_id = user.id
    self.visited = true
    self.save!
  end

  # Private methods (for example: custom validators)
  private

  ##
  # Save record that user visited this country
  #
  def visit_country
    self.user_countries.create!(user_id: self.visitor_id)
  end
end
