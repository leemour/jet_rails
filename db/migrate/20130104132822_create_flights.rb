class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.datetime :depart
      t.datetime :arrive
      t.integer :flight_num
      t.string :routing
      t.float :first_class
      t.float :coach

      t.timestamps
    end
  end
end
