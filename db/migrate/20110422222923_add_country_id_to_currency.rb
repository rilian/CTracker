class AddCountryIdToCurrency < ActiveRecord::Migration
  def self.up
    add_column :currencies, :country_id, :integer
    add_column :currencies, :country_code, :string
  end

  def self.down
    remove_column :currencies, :country_id
  end
end
