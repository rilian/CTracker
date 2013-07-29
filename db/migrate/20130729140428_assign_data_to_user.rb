class AssignDataToUser < ActiveRecord::Migration
  def change
    remove_column :countries, :visited

    create_table :user_countries, :id => false do |t|
      t.integer :user_id, null: false
      t.string :country_id, null: false

      t.timestamps
    end

    add_index :user_countries, [:user_id, :country_id], unique: true
  end
end
