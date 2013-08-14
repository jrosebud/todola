class AddTimesToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :days, :string
    add_column :places, :days2, :string
    add_column :places, :open2, :time
    add_column :places, :close2, :time
  end
end
