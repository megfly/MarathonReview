class Review < ApplicationRecord
    belongs_to :user
    belongs_to :run 

    validates :title, :review_race_name, :description, :rating, presence: true

    scope :highest_rating, -> { order(rating: :desc) }
end