class AddDescriptionToSpots < ActiveRecord::Migration[6.1]
  def change
    add_column :spots, :description, :text

  end
end
