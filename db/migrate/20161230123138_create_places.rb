class CreatePlaces < ActiveRecord::Migration[5.0]
  def change
    create_table :places do |t|
      t.references :act
      t.string :name
      t.string :type_of_area
      t.string :latitude
      t.string :longitude
      t.string :country
      t.string :city
      t.string :province
      t.text :description

      t.datetime :deleted_at, index: true
      t.timestamps null: false
    end
  end
end
