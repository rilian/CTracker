class CreateCurrencies < ActiveRecord::Migration
  def change
    create_table :currencies do |t|
      t.string :name
      t.string :code

      t.index :code, unique: true

      t.timestamps
    end
  end
end
