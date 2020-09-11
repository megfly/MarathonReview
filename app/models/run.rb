class Run < ApplicationRecord
    belongs_to :user #now we have @run.user
    #https://github.com/rails/rails/issues/25198 
    #https://api.rubyonrails.org/classes/ActiveRecord/Associations/ClassMethods.html#method-i-has_many
    #i am confused where to put the inverse
    has_many :reviews
    #, inverse_of: :run
    has_many :users, through: :reviews 
    #accepts_nested_attributes_for :reviews

    validates :run_race_name, :terrain, :location_city, :location_state, :month, presence: true 
    validates :run_race_name, uniqueness: true 
end