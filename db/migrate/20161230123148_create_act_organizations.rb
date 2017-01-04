class CreateActOrganizations < ActiveRecord::Migration[5.0]
  def change
    create_table :act_organizations do |t|
      t.string :name
      t.string :description
      t.string :label
      t.string :country
      t.boolean :supranational, default: false
      t.string :ancestry
      t.datetime :deleted_at, index: true
      t.timestamps null: false
    end

    create_table :act_organizations_acts do |t|
      t.belongs_to :act, index: true
      t.belongs_to :act_organization, index: true
    end
  end
end
