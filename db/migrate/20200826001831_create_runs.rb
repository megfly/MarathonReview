class CreateRuns < ActiveRecord::Migration[6.0]
  def change
    create_table :runs do |t|
      t.string :run_race_name 
      t.string :terrain
      t.string :location_city
      t.string :location_state
      t.string :month
      
      t.timestamps
    end
  end
end
