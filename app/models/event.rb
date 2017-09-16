ActiveRecord::Base.logger = Logger.new(STDOUT)

class Event < ApplicationRecord

    belongs_to :user, foreign_key: :creator_id
    belongs_to :category

    mount_uploader :cover_img, CoverUploader


    has_many :reviews
    has_many :posts

    validates :name, presence: true
    validates :description, presence: true
    validates :creator_id, presence: true
    validates :start_date, presence: true
    validates :lng, presence: true
    validates :lat, presence: true



    def event_params
    params.require(:event).permit(:name, :about, :cover_img)
    end

    # scope :filtered, -> (time, date, type) {
    #     where(time: time, start_date: date, type: )
    # }

    def self.filtered (time, date, type)
        r = self.where(time: time)
            .or(self.where(start_date: date))
            .or(self.where(category_id: type))
        # logger.debug r
    end

    # named_scope :filtered lambda { |time, date, type| {
    #     :conditions => { :time => time }
    # } }

end
