class Rent < ApplicationRecord
  belongs_to :user
  belongs_to :book
  validates :user, :book, :start_date, :end_date, presence: true

  scope :ending_today, -> { where(end_date: Date.current) }
end
