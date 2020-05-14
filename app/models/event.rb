class Event < ApplicationRecord
  validates :start_date, presence: true
  validate :start_date_after_date
  validates :duration, presence: true
  validate :ismultiple_of_5?
  validates :title, presence: true, length: { in: 5..140 }
  validates :description, presence: true, length: { in: 20..1000 }
  validates :price, presence: true, length: { in: 1..1000 }
  validates :location, presence: true

  has_many :attendances
  has_many :users, through: :attendances

  private

  def start_date_after_date
    date=Time.now
    return if date.blank? || start_date.blank?

    if date > start_date
      errors.add(:date, "must be after the date")
    end
  end

  def ismultiple_of_5?
  return if duration.blank?

    if duration%5 !=0 || duration < 0
      errors.add(:duration, "must be a positive number multiple of 5")
    end
  end

end
