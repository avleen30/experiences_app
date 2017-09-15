class EventsUser < ApplicationRecord

    belongs_to :user
    belongs_to :event

    def events_user_params
    params.require(:event).permit(:status)
    end

end

