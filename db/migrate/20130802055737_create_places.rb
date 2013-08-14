class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.references :user, index: true
      t.references :category, index: true
      t.references :area, index: true
      t.string :name
      t.text :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone
      t.string :website
      t.time :open
      t.time :close
      t.string :image

      t.timestamps
    end
  end
end
