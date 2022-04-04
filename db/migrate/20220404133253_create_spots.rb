class CreateSpots < ActiveRecord::Migration[6.1]
  def change
    create_table :spots do |t|
      t.float :longitude
      t.float :latitude
      t.string :address
      t.integer :spot_number

      t.timestamps
    end
  end
end
