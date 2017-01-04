class CreateResults < ActiveRecord::Migration[5.0]
  def change
    create_table :results do |t|
      t.references :act
      t.integer :arrested
      t.integer :deaths
      t.integer :economic_cost
      t.integer :injured
      t.integer :missing
      t.integer :personal_attacks
      t.integer :property_attacks

      t.datetime :deleted_at, index: true
      t.timestamps null: false
    end
  end
end
