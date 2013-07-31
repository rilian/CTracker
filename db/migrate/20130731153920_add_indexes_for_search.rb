class AddIndexesForSearch < ActiveRecord::Migration
  def change
    add_index :countries, :name
    add_index :currencies, :name
    add_index :currencies, :code
    add_index :currencies, :country_code
  end
end
