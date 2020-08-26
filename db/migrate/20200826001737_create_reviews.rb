class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.belongs_to :run
      t.belongs_to :user
      t.string :title 
      t.string :review_race_name
      t.text :description
      t.integer :rating
      
      t.timestamps
    end
  end
end
