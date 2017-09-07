class Event < ApplicationRecord

    belongs_to :user, foreign_key: :creator_id
    belongs_to :category

    has_many :reviews
    has_many :posts

    validates :name, presence: true
    validates :description, presence: true
    validates :creator_id, presence: true
    validates :start_date, presence: true
    validates :end_date, presence: true
    validates :longitude, presence: true
    validates :latitude, presence: true

end
