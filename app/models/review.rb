class Review < ApplicationRecord
    belongs_to :user
    #required: false #https://stackoverflow.com/questions/39359168/rails-nested-form-error-child-must-exist
    belongs_to :run

    validates :title, :review_race_name, :description, :rating, presence: true

    scope :highest_rating, -> { order(rating: :desc) }
end