class Run < ApplicationRecord

    has_many :reviews
    has_many :users, through: :reviews 

    validates :run_race_name, :terrain, :location_city, :location_state, :month, presence: true 

end