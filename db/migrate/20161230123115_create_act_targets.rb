class CreateActTargets < ActiveRecord::Migration[5.0]
  def change
    create_table :act_targets do |t|
      t.integer :old_id
      t.string :name
      t.string :description
      t.string :label
      t.string :ancestry
      t.datetime :deleted_at, index: true
      t.timestamps null: false
    end

    create_table :act_targets_acts do |t|
      t.belongs_to :act, index: true
      t.belongs_to :act_target, index: true
    end
  end
end
