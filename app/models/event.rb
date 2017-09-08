class Event < ApplicationRecord

    belongs_to :user, foreign_key: :creator_id
    belongs_to :category

    has_many :reviews
    has_many :posts, -> {order "created_at DESC"}

    validates :name, presence: true
    validates :description, presence: true
    validates :creator_id, presence: true
    validates :start_date, presence: true
    validates :end_date, presence: true
    validates :lng, presence: true
    validates :lat, presence: true

    scope :filtered, (time, date, type) -> {
        where(events.start_time),
        where(events.start_date),
        where(events.type),

    }

end
