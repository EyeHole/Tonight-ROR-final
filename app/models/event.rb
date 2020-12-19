class Event < ApplicationRecord
    belongs_to :user
    has_many :visitors, dependent: :destroy

    validates :start_date,
          date: { after: Proc.new { Time.now } }

    validates :end_date,
            date: { after: :start_date }
end
