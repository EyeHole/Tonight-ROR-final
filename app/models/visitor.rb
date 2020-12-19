class Visitor < ApplicationRecord
    belongs_to :event
    validates :event_id, uniqueness: { scope: :user_id }, presence: true
    validates :user_id, presence: true
end
