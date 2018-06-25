class Notification < ApplicationRecord
  scope :by_date, -> { order(created_at: :desc) }
end
