class AddIndexes < ActiveRecord::Migration
  def change
    add_index :countries, :code
    add_index :currencies, :country_id
  end
end
