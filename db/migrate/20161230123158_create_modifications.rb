class CreateModifications < ActiveRecord::Migration[5.0]
  def change
    create_table :modifications do |t|
      t.references :user, null: false
      t.references :act, null: false
      t.string :column
      t.string :from_value
      t.string :to_value

      t.timestamps null: false
    end
  end
end
