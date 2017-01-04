class CreateActTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :act_types do |t|
      t.string :name, null: false
      t.string :description

      t.datetime :deleted_at, index: true
      t.timestamps null: false
    end

    create_table :act_types_acts, id: false do |t|
      t.belongs_to :act_type, index: true
      t.belongs_to :act, index: true
    end
  end
end
