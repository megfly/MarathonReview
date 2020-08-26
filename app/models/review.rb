class Review < ApplicationRecord
    belongs_to :user
    belongs_to :run 

    validates :title, :review_race_name, :description, :rating, presence: true
    
end


create_table "reviews", force: :cascade do |t|
    t.integer "run_id"
    t.integer "user_id"
    t.string "title"
    t.string "review_race_name"
    t.text "description"
    t.integer "rating"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["run_id"], name: "index_reviews_on_run_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end
