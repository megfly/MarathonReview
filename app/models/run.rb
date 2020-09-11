class Run < ApplicationRecord
    belongs_to :user #now we have @run.user
    has_many :reviews
    has_many :users, through: :reviews 
    accepts_nested_attributes_for :reviews

    validates :run_race_name, :terrain, :location_city, :location_state, :month, presence: true 
end